#include "symbol_stack.h"

#include <iostream>
#include <stack>
#include <string>
#include <unordered_map>
#include <vector>

// Global variable definition
std::unordered_map<std::string, std::vector<int>> arrayDimensionsMap;


std::stack<SymbolTable> scopes;
std::string lastType;
std::string nowType;

std::string getLastType()
{
    std::cout << "\nlastType: " << lastType << std::endl;
    return lastType;
}
void setLastType(std::string type)
{
    std::cout << "\nsetLastType: " << type << std::endl;
    lastType = type;
}

std::string getNowType()
{
    std::cout << "\nnowType: " << nowType << std::endl;
    return nowType;
}

void setNowType(std::string type)
{
    std::cout << "\nsetNowType: " << type << std::endl;
    nowType = type;
}

void enterScope()
{
    scopes.push(SymbolTable());
}

void exitScope()
{
    if (!scopes.empty())
    {
        scopes.pop();
    }
}

void addSymbol(const Symbol& symbol)
{
    if (scopes.empty())
    {
        return;
    }
    scopes.top()[symbol.identifier] = symbol;
}

Symbol* findSymbol(const std::string& identifier)
{
    auto tempStack = scopes;
    while (!tempStack.empty())
    {
        auto it = tempStack.top().find(identifier);
        if (it != tempStack.top().end())
        {
            return &it->second;
        }
        tempStack.pop();
    }
    return nullptr;
}

int getSymbolSize(const std::string& identifier)
{
    auto symbol = findSymbol(identifier);
    if (symbol != nullptr)
    {
        return getSymbolSize(*symbol);
    }
    else
    {
        return 0;
    }
}


int getSymbolSize(const Symbol& symbol)
{
    if (symbol.kind == SymbolKind::Variable)
    {
        return 4;
    }
    else
    {
        return 0;
    }
}

int declareVariable(const std::string& type, const std::string& identifier)
{
    if (findSymbol(identifier) != nullptr)
    {
        return -1;
    }
    Symbol symbol(SymbolKind::Variable, type, identifier);
    addSymbol(symbol);
    return 0;
}

int declareFunction(const std::string& type, const std::string& identifier)
{
    if (findSymbol(identifier) != nullptr)
    {
        return -1;
    }
    Symbol symbol(SymbolKind::Function, type, identifier);
    addSymbol(symbol);
    return 0;
}

int getTypeSize(const std::string& type)
{
    if (type == "int")
    {
        return 4;
    }
    else if (type == "float")
    {
        return 4;
    }
    else
    {
        std::cerr << "Error: Unknown type " << type << std::endl;
        exit(1);
    }
}

int declareArray(const std::string& type, const std::string& name, const std::string& dims) {
    if (isAccessible(name) == 1) {
        return -1;
    }
    int typeSize = getTypeSize(type);
    int totalSize = typeSize;

    // Calculate total size for multi-dimensional arrays
    size_t pos = 0;
    std::vector<int> dimensions;
    while ((pos = dims.find('[', pos)) != std::string::npos) {
        size_t endPos = dims.find(']', pos);
        int dimSize = std::stoi(dims.substr(pos + 1, endPos - pos - 1));
        totalSize *= dimSize;
        dimensions.push_back(dimSize);
        pos = endPos + 1;
    }

    Symbol symbol(SymbolKind::Variable, type, name);
    symbol.size = totalSize;
    addSymbol(symbol);

    // Store dimensions in the global map
    arrayDimensionsMap[name] = dimensions;

    return 0;
}

int isAccessible(const std::string& identifier)
{
    Symbol* symbol = findSymbol(identifier);
    if (symbol != nullptr)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void printStack(){
    auto tempStack = scopes;
    while (!tempStack.empty())
    {
        for (auto it = tempStack.top().begin(); it != tempStack.top().end(); ++it)
        {
            std::cerr << it->first << " " << it->second.type << std::endl;
        }
        tempStack.pop();
    }
}

Symbol accessSymbol(const std::string& identifier)
{
    Symbol* symbol = findSymbol(identifier);
    if (symbol != nullptr)
    {
        return *symbol;
    }
    else
    {
        return Symbol(SymbolKind::Variable, "", "");
    }
}


std::vector<int> getArrayDimensions(const std::string& name) {
    if (arrayDimensionsMap.find(name) != arrayDimensionsMap.end()) {
        return arrayDimensionsMap[name];
    }
    return std::vector<int>();
}

// ...existing code...
// int main(){
//     enterScope();
//     declareVariable("int", "a");
//     declareVariable("int", "b");

//     std::cout << "a: " << isAccessible("a") << std::endl; // 1

//     std::cout << "b: " << isAccessible("b") << std::endl; // 1


//     enterScope();

//     declareVariable("int", "c");

//     std::cout << "c: " << isAccessible("c") << std::endl; // 1

//     std::cout << "a: " << isAccessible("a") << std::endl; // 1

//     exitScope();

//     std::cout << "c: " << isAccessible("c") << std::endl; // 0

//     exitScope();

//     std::cout << "a: " << isAccessible("a") << std::endl; // 0
    

// }