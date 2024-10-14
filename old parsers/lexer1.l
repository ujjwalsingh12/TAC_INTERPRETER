%{
#include "parser1.tab.h"
%}


%%
global      {yylval.str = yytext;return GLOBAL;}
ENDD       { return ENDD;}
[ \t\n]        { ; }
=             {yylval.str = yytext;return EQ;}
"("             { yylval.str = yytext;return OP;}
")"             { yylval.str = yytext;return CP;}
goto          { yylval.str = yytext;return GOTO; }
if            { yylval.str = yytext;return IF; }
return        { yylval.str = yytext;return RETURN; }
param         { yylval.str = yytext;return PARAM; }
call          { yylval.str = yytext;return CALL; }
\".*\"        { yylval.str = yytext;return STR; }
"t"[0-9]+       { yylval.str = yytext; return TEMPORARY; }   // Temporary variables like t1, t2, etc.
"L"[0-9]+":"    { yylval.str = yytext; return LABEL; }       // Labels like L1, L2, etc.
"L"[0-9]+       { yylval.str = yytext; return GOTO_LABEL; }       // Labels like L1, L2, etc.
[a-zA-Z_][a-zA-Z_0-9]*: { yylval.str = yytext; return F_IDENTIFIER; }  // Identifiers for variables, functions
[a-zA-Z_][a-zA-Z_0-9]* { yylval.str = yytext; return IDENTIFIER; }  // Identifiers for variables, functions
[0-9]+         { yylval.str = yytext; return NUMBER; }       // Numeric constants
[=+\-*/]       { yylval.str = yytext; return H; }      // Operators and assignment
.              { printf("Unexpected character: %s\n", yytext); }
%%

