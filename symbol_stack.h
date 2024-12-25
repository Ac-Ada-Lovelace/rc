#ifndef SYMBOL_STACK_H
#define SYMBOL_STACK_H

#include <stack>
#include <string>
#include <unordered_map>
#include <vector>

// Enum for symbol kind
enum class SymbolKind {
    Variable,
    Function
};

// Symbol struct
struct Symbol {
    SymbolKind kind;
    std::string type;
    std::string identifier;

    Symbol() : kind(SymbolKind::Variable), type(""), identifier("") {}
    Symbol(SymbolKind _kind, const std::string& _type, const std::string& _identifier)
        : kind(_kind), type(_type), identifier(_identifier) {}
};

// Symbol table type
using SymbolTable = std::unordered_map<std::string, Symbol>;

// Global variables
extern std::stack<SymbolTable> scopes;

// Function declarations
void enterScope();
void exitScope();
void addSymbol(const Symbol& symbol);
Symbol* findSymbol(const std::string& identifier);

#endif // SYMBOL_STACK_H