%{
#include <stdio.h>
#include <stdlib.h>

// Define external yylex function from Lex
int yylex();
void yyerror(const char *s);
%}

%union {
    char *str;
}

// Define tokens
%token <str> IDENTIFIER NUMBER TEMPORARY LABEL GOTO GOTO_LABEL IF RETURN PARAM CALL H OP CP

%%

// Grammar rules and actions

program:
    program token
    | /* empty */
    ;

token:
    IDENTIFIER   { printf("IDENTIFIER: %s\n", $1); }
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
    // | '='           { printf("EQUALS: %c\n", $1); }
    // | '+'           { printf("PLUS: %c\n", $1); }
    // | '-'           { printf("MINUS: %c\n", $1); }
    // | '*'           { printf("STAR: %c\n", $1); }
    // | '/'           { printf("SLASH: %c\n", $1); }
    ;

%%

// Main function to start the parser
int main() {
    return yyparse();
}

// Error handling function
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}