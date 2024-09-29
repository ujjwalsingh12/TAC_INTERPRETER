%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TEMPS 100

typedef struct {
    char name[10];
    int value;
} TempVar;

TempVar temps[MAX_TEMPS];
int tempCount = 0;

typedef struct {
    char name[10];
    int position;
} Label;

Label labelTable[MAX_TEMPS];
int labelCount = 0;
int currentStatement = 0; // Position in the statement list

int getTempValue(const char *name) {
    for (int i = 0; i < tempCount; i++) {
        if (strcmp(temps[i].name, name) == 0) {
            return temps[i].value;
        }
    }
    return 0; // Default value for uninitialized
}

void setTempValue(const char *name, int value) {
    for (int i = 0; i < tempCount; i++) {
        if (strcmp(temps[i].name, name) == 0) {
            temps[i].value = value;
            return;
        }
    }
    strcpy(temps[tempCount].name, name);
    temps[tempCount].value = value;
    tempCount++;
}

void addLabel(const char *name, int position) {
    strcpy(labelTable[labelCount].name, name);
    labelTable[labelCount].position = position;
    labelCount++;
}

int getLabelPosition(const char *name) {
    for (int i = 0; i < labelCount; i++) {
        if (strcmp(labelTable[i].name, name) == 0) {
            return labelTable[i].position;
        }
    }
    return -1; // Label not found
}

void printTempVars() {
    for (int i = 0; i < tempCount; i++) {
        printf("%s = %d\n", temps[i].name, temps[i].value);
    }
}

%}

%union {
    int intval;
    char *tempname;
}

%token <intval> NUM
%token <tempname> TEMP LABEL_ID
%type <intval> expr term factor
%type <tempname> assignment if_else statement program

%% 

program:
    statement { 
        currentStatement = 0; 
        while (currentStatement < $$.last) {
            currentStatement++;
        }
    }
    |;

statement:
    assignment { 
        $$.last = currentStatement; 
    }
    | label {
        addLabel($1, currentStatement);
    }
    | goto_statement {
        currentStatement = getLabelPosition($1);
    }
    | if_else { 
        $$.last = currentStatement; 
    }
    ;

assignment:
    TEMP '=' expr {
        setTempValue($1, $3);
        currentStatement++;
    }
    ;

label:
    LABEL_ID ':' {
        $$ = $1;
        currentStatement++;
    }
    ;

goto_statement:
    "goto" LABEL_ID {
        currentStatement = getLabelPosition($1);
    }
    ;

if_else:
    "if" expr "then" statement {
        if ($2) {
            currentStatement++;
        }
    }
    "else" statement {
        currentStatement++;
    }
    ;

expr:
    expr '+' term {
        $$ = $1 + $3;
    }
    | expr '-' term {
        $$ = $1 - $3;
    }
    | term
    ;

term:
    term '*' factor {
        $$ = $1 * $3;
    }
    | term '/' factor {
        $$ = $1 / $3;
    }
    | factor
    ;

factor:
    TEMP {
        $$ = getTempValue($1);
    }
    | NUM {
        $$ = $1;
    }
    | '(' expr ')' {
        $$ = $2;
    }
    ;

%% 

int main() {
    yyparse();
    printTempVars();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}