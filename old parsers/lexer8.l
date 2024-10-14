%{
#include "parser8.tab.h"
%}

%%
[0-9]+           { yylval.intval = atoi(yytext); return NUM; }
t[0-9]+         { yylval.tempname = strdup(yytext); return TEMP; }
L[0-9]+         { yylval.tempname = strdup(yytext); return LABEL_ID; }
"goto"          { return "goto"; }
"if"            { return "if"; }
"then"          { return "then"; }
"else"          { return "else"; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"="             { return '='; }
"("             { return '('; }
")"             { return ')'; }
[ \t\n]+        { /* ignore whitespace */ }
.               { printf("Unexpected character: %s\n", yytext); }
%%