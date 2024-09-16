%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *s);

// TAC structure definition
typedef struct TAC {
    char *result;
    char *arg1;
    char *arg2;
    char *op;
} TAC;

TAC *create_TAC(char *result, char *arg1, char *arg2, char *op);
void print_TAC(TAC *tac);
%}

// Define the types in the union
%union {
    int num;          // For NUMBER tokens
    char *id;         // For IDENTIFIER tokens
    TAC *tac;         // For expressions and statements that generate TAC
}

%token IF ELSE WHILE RETURN INT
%token EQ ASSIGN PLUS MINUS MUL DIV
%token SEMICOLON LPAREN RPAREN LBRACE RBRACE
%token <id> IDENTIFIER
%token <num> NUMBER

%type <tac> stmt expr

%%

program:
    program stmt
    | /* empty */
    ;

stmt:
    expr SEMICOLON { $$ = $1; }
    | IF LPAREN expr RPAREN stmt
    | WHILE LPAREN expr RPAREN stmt
    ;

expr:
    IDENTIFIER ASSIGN expr {
        TAC *tac = create_TAC($1, $3->result, NULL, "=");
        print_TAC(tac);
        $$ = tac;
    }
    | expr PLUS expr {
        TAC *tac = create_TAC("t1", $1->result, $3->result, "+");
        print_TAC(tac);
        $$ = tac;
    }
    | NUMBER {
        $$ = create_TAC(strdup($1), NULL, NULL, "num");  // This line will now correctly refer to yylval.num from lexer
    }
    ;

%%

TAC *create_TAC(char *result, char *arg1, char *arg2, char *op) {
    TAC *tac = (TAC *)malloc(sizeof(TAC));
    tac->result = result;
    tac->arg1 = arg1;
    tac->arg2 = arg2;
    tac->op = op;
    return tac;
}

void print_TAC(TAC *tac) {
    if (tac->arg2 == NULL) {
        printf("%s = %s\n", tac->result, tac->arg1);
    } else {
        printf("%s = %s %s %s\n", tac->result, tac->arg1, tac->op, tac->arg2);
    }
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}