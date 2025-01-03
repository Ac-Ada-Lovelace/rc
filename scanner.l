%{
#define YYSTYPE char *
#include "y.tab.h"
#include <cstring>
#include <iostream>
#include "symbol_stack.h"


int cur_line = 1;
void yyerror(const char *msg);
void unrecognized_char(char c);
void unterminate_string();
#define _DUPTEXT {yylval = strdup(yytext);}

extern std::stack<SymbolTable> scopes;
extern std::string lastType;
extern std::string nowType;
%}

/* note \042 is '"' */
WHITESPACE          ([ \t\r\a]+)
SINGLE_COMMENT1     ("//"[^\n]*)
SINGLE_COMMENT2     ("#"[^\n]*)
OPERATOR            ([+*-/%=,;!<>(){}[\]])
INTEGER             ([0-9]+)
FLOAT               ([0-9]+\.[0-9]+)
IDENTIFIER          ([_a-zA-Z][_a-zA-Z0-9]*)
UNTERM_STRING       (\042[^\042\n]*)
STRING              (\042[^\042\n]*\042)

%%

\n                  { cur_line++; }
{WHITESPACE}        { /* ignore every whitespace */ }
{SINGLE_COMMENT1}   { /* skip for single line comment */    }
{SINGLE_COMMENT2}   { /* skip for single line comment */    }

{OPERATOR}          { return yytext[0]; }
"int"               { return T_Int; }
"float"             { return T_Float; }
"void"              { return T_Void; }
"return"            { return T_Return; }
"print"             { return T_Print; }
"readint"           { return T_ReadInt; }
"while"             { return T_While; }
"if"                { return T_If; }
"else"              { return T_Else; }
"break"             { return T_Break; }
"continue"          { return T_Continue; }
"<="                { return T_Le; }
">="                { return T_Ge; }
"=="                { return T_Eq; }
"!="                { return T_Ne; }
"&&"                { return T_And; }
"||"                { return T_Or; }
"&"                 { return T_Addr; }  // 取址操作符


{INTEGER}           { _DUPTEXT return T_IntConstant; }
{FLOAT}             { _DUPTEXT return T_FloatConstant; }
{STRING}            { _DUPTEXT return T_StringConstant; }
{IDENTIFIER}        { _DUPTEXT return T_Identifier; }

{UNTERM_STRING}     { unterminate_string(); }
.                   { unrecognized_char(yytext[0]); }

%%

int yywrap(void) { 
    return 1;
}

void unrecognized_char(char c) {
    char buf[32] = "Unrecognized character: ?";
    buf[24] = c;
    yyerror(buf);
}

void unterminate_string() {
    yyerror("Unterminate string constant");
}

void yyerror(const char *msg) {
    std::cerr << "Error at line " << cur_line << ":\n\t" << msg << std::endl;
    exit(-1);
}