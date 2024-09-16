%{

#include <iostream>
#include <vector>
#include <string>
#include <unordered_map>
using namespace std;
// Define external yylex function from Lex
int yylex();
void yyerror(const char *s);
unordered_map<string,int> globals;
unordered_map<string,int > functions;
unordered_map<string,vector<int> > symboltable;
int stop_parsing = 0;
int Ntemp = 0;
%}

%union {
    char *str;
}

// Define tokens
%token <str> RETVAL GLOBAL STR EQ ENDD IDENTIFIER F_IDENTIFIER NUMBER TEMPORARY LABEL GOTO GOTO_LABEL IF RETURN PARAM CALL H OP CP

%%

// Grammar rules and actions

program:
    // | token program
    // | token 
    | globals // mainfucntion
    | functions program
    // | token program 
    | ENDD  { printf("Ending...\n");stop_parsing = 1;YYABORT;}
    ;

globals : {printf("global begin\n");} globaldecl globals {printf("global end\n");} | ;
globaldecl: GLOBAL IDENTIFIER 
            { 
                printf("declared global: %s\n", $2);
                globals[$2] = 0;                              
            } //GLOBAL VARIABLE INITIALIZED 
        | TEMPORARY EQ NUMBER 
        {
            if(symboltable.find($1)==symboltable.end()){
                vector<int> a; a.push_back(stoi($3));
                symboltable[$1] = a;
            }
            else{
                symboltable[$1].push_back(stoi($3));
            }
        }
        | TEMPORARY EQ TEMPORARY 
        {
            if(symboltable.find($1)==symboltable.end()){
                vector<int> a; a.push_back(symboltable[$3].back());
                symboltable[$1] = a;
            }
            else{
                symboltable[$1].push_back(symboltable[$3].back());
            }
        }
        | IDENTIFIER EQ TEMPORARY 
        {
            if(symboltable.find($1)==symboltable.end()){
                vector<int> a; a.push_back(symboltable[$3].back());
                symboltable[$1] = a;
            }
            else{
                symboltable[$1].push_back(symboltable[$3].back());
            }
        }
        ; 

functions : {printf("funtion begins\n");} F_IDENTIFIER {functions[$2]=4;} tokens RETURN {printf("fucntion ends\n");} | ;
tokens : token tokens | ;
// functions : functions function {printf("here\n");} | ;
function : LABEL fdata ;

fdata : params statements RETURN ;

params : paramdef params | ;

paramdef : IDENTIFIER EQ PARAM { printf("PARAM: %s %s %s\n", $1,$2,$3); };

statements : RETVAL EQ IDENTIFIER | ;





token: 
    STR      { printf("STR: %s\n", $1); }
    
    |IDENTIFIER   { printf("IDENTIFIER: %s\n", $1); 
                        vector<int> aa;
                        symboltable[$1] = aa; }
    |F_IDENTIFIER   { printf("F_IDENTIFIER: %s\n", $1); }
    | NUMBER      { printf("NUMBER: %s\n", $1); }
    | TEMPORARY   { printf("TEMPORARY: %s\n", $1); }
    // | LABEL       { printf("LABEL: %s\n", $1); }
    | GOTO        { printf("GOTO: %s\n", $1); }
	| GOTO_LABEL  { printf("GOTO_LABEL: %s\n", $1); }
    | IF          { printf("IF: %s\n", $1); }
    // | RETURN      { printf("RETURN: %s\n", $1); }
    | PARAM       { printf("PARAM: %s\n", $1); }
    | CALL        { printf("CALL: %s\n", $1); }
	| H 			{ printf("H: %s\n", $1); }
	| OP 			{ printf("%s\n", $1); }
	| CP			{ printf("%s\n", $1); }
    | EQ            { printf("%s\n", $1);}
    | RETVAL        { printf("RETVAL: %s\n", $1); }
    // | '='           { printf("EQUALS: %c\n", $1); }
    // | '+'           { printf("PLUS: %c\n", $1); }
    // | '-'           { printf("MINUS: %c\n", $1); }
    // | '*'           { printf("STAR: %c\n", $1); }
    // | '/'           { printf("SLASH: %c\n", $1); }
    ;

globalini: TEMPORARY EQ NUMBER IDENTIFIER EQ TEMPORARY 
{ 
    printf("initialize: %s\n = %d", $4,stoi($3));
    // globals[$2] = 0;                              
} //GLOBAL VARIABLE INITIALIZED 
%%

// Main function to start the parser
int main() {
        while (!stop_parsing) {
        yyparse();
    }
    for (const auto& pair : globals) {
        std::cout << "global variable: " << pair.first << " = " << pair.second;
       std::cout << std::endl;
    }
    for (const auto& pair : symboltable) {
        std::cout << "Key: " << pair.first << " -> Values: ";
        for (int value : pair.second) {
            std::cout << value << " ";
        }
        std::cout << std::endl;
    }
  for (const auto& pair : functions) {
        std::cout << "function name: " << pair.first << " = " << pair.second;
       std::cout << std::endl;
    }
    return 0;
}

// Error handling function
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);

}