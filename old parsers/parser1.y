%{

#include <iostream>
#include <vector>
#include <string>
#include <unordered_map>
using namespace std;
// Define external yylex function from Lex
int yylex();
void yyerror(const char *s);
unordered_map<string,vector<int> > symboltable;
int stop_parsing = 0;
string s="";
%}

%union {
    char *str;
}

// Define tokens
%token <str> RETVAL GLOBAL STR EQ ENDD IDENTIFIER F_IDENTIFIER NUMBER TEMPORARY LABEL GOTO GOTO_LABEL IF RETURN PARAM CALL H OP CP

%%

// Grammar rules and actions

program:
    program token
    | /* empty */
    ;

token:
     RETVAL  { printf("RETVAL: %s\n", $1); }
    |GLOBAL  { printf("GLOBAL: %s\n", $1); }
    | STR      { printf("STR: %s\n", $1); }
    | ENDD  { printf("asdf");stop_parsing = 1;YYABORT;}
    |IDENTIFIER   { printf("IDENTIFIER: %s\n", $1); 
                        vector<int> aa;
                        symboltable[$1] = aa; }
    |F_IDENTIFIER   { printf("F_IDENTIFIER: %s\n", $1); }
    | NUMBER      { printf("NUMBER: %s\n", $1); }
    | TEMPORARY   { printf("TEMPORARY: %s\n", $1); }
    | LABEL       { printf("LABEL: %s\n", $1); }
    | GOTO        { printf("GOTO: %s\n", $1); }
	| GOTO_LABEL  { printf("GOTO_LABEL: %s\n", $1); }
    | IF          { printf("IF: %s\n", $1); }
    | RETURN      { printf("RETURN: %s\n", $1); }
    | PARAM       { printf("PARAM: %s\n", $1); }
    | CALL        { printf("CALL: %s\n", $1); }
	| H 			{ printf("H: %s\n", $1); }
	| OP 			{ printf("%s\n", $1); }
	| CP			{ printf("%s\n", $1); }
    | EQ            { printf("%s\n", $1);}
    // | '='           { printf("EQUALS: %c\n", $1); }
    // | '+'           { printf("PLUS: %c\n", $1); }
    // | '-'           { printf("MINUS: %c\n", $1); }
    // | '*'           { printf("STAR: %c\n", $1); }
    // | '/'           { printf("SLASH: %c\n", $1); }
    ;


%%

// Main function to start the parser
int main() {
        while (!stop_parsing) {
        yyparse();
    }
    for (const auto& pair : symboltable) {
        std::cout << "Key: " << pair.first << " -> Values: ";
        for (int value : pair.second) {
            std::cout << value << " ";
        }
        std::cout << std::endl;
    }
    return 0;
}

// Error handling function
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);

}