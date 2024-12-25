#ifndef SYMBOL_STACK_H
#define SYMBOL_STACK_H

#include <stack>
#include <string>
#include <unordered_map>
#include <vector>

// Enum for symbol kind
enum class SymbolKind
{
    Variable,
    Function
};

// Symbol struct
struct Symbol
{
    SymbolKind kind;
    std::string type;
    std::string identifier;
    int size;
    Symbol() : kind(SymbolKind::Variable), type(""), identifier("") {}
    Symbol(SymbolKind _kind, const std::string& _type,
           const std::string& _identifier)
        : kind(_kind), type(_type), identifier(_identifier)
    {
    }
};

// Symbol table type
using SymbolTable = std::unordered_map<std::string, Symbol>;

// Global variables
extern std::stack<SymbolTable> scopes;
extern std::string lastType;
extern std::string nowType;
// Function declarations
std::string getLastType();
void setLastType(std::string type);
std::string getNowType();
void setNowType(std::string type);

void enterScope();
void exitScope();

void addSymbol(const Symbol& symbol);
Symbol* findSymbol(const std::string& identifier);

int declareVariable(const std::string& type, const std::string& identifier);
int declareFunction(const std::string& type, const std::string& identifier);
int declareArray(const std::string& type, const std::string& name, const std::string& dims);
int isAccessible(const std::string& identifier);
Symbol* getSymbol(const std::string& identifier);

int getSymbolSize(const std::string& identifier);
int getSymbolSize(const Symbol& symbol);

std::vector<int> getArrayDimensions(const std::string& name);
void printStack();
#endif  // SYMBOL_STACK_H