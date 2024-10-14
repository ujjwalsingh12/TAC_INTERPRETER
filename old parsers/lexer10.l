%{
#include "parser7.tab.h"
using namespace std;
%}


%%
retval      {yylval.str = strdup(yytext);return RETVAL;}
global      {yylval.str = strdup(yytext);return GLOBAL;}
ENDD       { return ENDD;}
[ \t\n]        {; }
"="             {yylval.str = strdup(yytext);return EQ;}
"("             { yylval.str = strdup(yytext);return OP;}
")"             { yylval.str = strdup(yytext);return CP;}
goto          { yylval.str = strdup(yytext);return GOTO; }
if            { yylval.str = strdup(yytext);return IF; }
return        { yylval.str = strdup(yytext);return RETURN; }
param[0-9]+         { yylval.str = strdup(yytext);return PARAM; }
call          { yylval.str = strdup(yytext);return CALL; }
\".*\"        { yylval.str = strdup(yytext);return STR; }
"t"[0-9]+       { yylval.str = strdup(yytext); return TEMPORARY; }   // Temporary variables like t1, t2, etc.
"L"[0-9]+":"    { yylval.str = strdup(yytext); return LABEL; }       // Labels like L1, L2, etc.
"L"[0-9]+       { yylval.str = strdup(yytext); return GOTO_LABEL; }       // Labels like L1, L2, etc.
[a-zA-Z_][a-zA-Z_0-9]*: { yylval.str = strdup(yytext); return F_IDENTIFIER; }  // Identifiers for variables, functions
[a-zA-Z_][a-zA-Z_0-9]* { yylval.str = strdup(yytext); return IDENTIFIER; }  // Identifiers for variables, functions
[0-9]+         { yylval.str = strdup(yytext); return NUMBER; }       // Numeric constants
[+\-*/<>]       { yylval.str = strdup(yytext); return H; }      // Operators and assignment
.              { printf("Unexpected character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}