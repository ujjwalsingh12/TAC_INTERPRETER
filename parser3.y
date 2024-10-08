%{

#include <iostream>
#include <vector>
#include <string>
#include <unordered_map>
#include <sstream>
using namespace std;
// Define external yylex function from Lex
int yylex();
void yyerror(const char *s);
unordered_map<string,int> globals;
unordered_map<string,int > functions;
unordered_map<int,string > functioncode;
unordered_map<string,vector<int> > symboltable;
unordered_map<int,unordered_map<string,vector<int> > > fsymboltable;
int retval = 0;
vector<int> PARAMS(100,0);
int NFUNC = -1;
int stop_parsing = 0;
int Ntemp = 0;



void createfunc(string fun){
    NFUNC++;
    functions[fun] = NFUNC;
    functioncode[NFUNC] = "";
    unordered_map<string,vector<int> > table;
    fsymboltable[NFUNC] = table;
    
}

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
    // | globals // mainfucntion
    | globals functions program
    // | token program 
    | ENDD  { printf("Ending...\n");stop_parsing = 1;YYABORT;}
    ;

globals : {printf("global begin\n");} globaldecl globals {printf("global end\n");} | RETURN;
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

functions   : {printf("funtion begins\n");} F_IDENTIFIER {createfunc($2);} tokens RETURN {printf("fucntion ends\n");} | ;
tokens      : token tokens | OP decls CP tokens | ;
decls       : paramdecls fundecls retvaldecl    | ;
paramdecls  : paramdecl paramdecls |;

retvaldecl : RETVAL EQ NUMBER 
        {
            retval = stoi($3);
        }
        | RETVAL EQ TEMPORARY 
        {
            retval = fsymboltable[NFUNC][$3].back();
        }
        | RETVAL EQ IDENTIFIER 
        {
            retval = fsymboltable[NFUNC][$3].back();
        }
        | ; 

paramdecl : IDENTIFIER EQ PARAM 
        {
            if(fsymboltable[NFUNC].find($1)==fsymboltable[NFUNC].end()){
                string s = $3;
                int i = PARAMS[stoi(s.substr(5))];
                vector<int> a; a.push_back(i);
                fsymboltable[NFUNC][$1] = a;
            }
            else{
                string s = $3;
                int i = PARAMS[stoi(s.substr(5))];
                fsymboltable[NFUNC][$1].push_back(i);
            }
        }
        ; 

fundecls : fundecl fundecls | ;

fundecl: TEMPORARY EQ NUMBER 
        {
            if(fsymboltable[NFUNC].find($1)==fsymboltable[NFUNC].end()){
                vector<int> a; a.push_back(stoi($3));
                fsymboltable[NFUNC][$1] = a;
            }
            else{
                fsymboltable[NFUNC][$1].push_back(stoi($3));
            }
        }
        | TEMPORARY EQ TEMPORARY 
        {
            if(fsymboltable[NFUNC].find($1)==fsymboltable[NFUNC].end()){
                vector<int> a; a.push_back(fsymboltable[NFUNC][$3].back());
                fsymboltable[NFUNC][$1] = a;
            }
            else{
                fsymboltable[NFUNC][$1].push_back(fsymboltable[NFUNC][$3].back());
            }
        }
        | IDENTIFIER EQ TEMPORARY 
        {
            if(fsymboltable[NFUNC].find($1)==fsymboltable[NFUNC].end()){
                vector<int> a; a.push_back(fsymboltable[NFUNC][$3].back());
                fsymboltable[NFUNC][$1] = a;
            }
            else{
                fsymboltable[NFUNC][$1].push_back(fsymboltable[NFUNC][$3].back());
            }
        }
        | TEMPORARY EQ IDENTIFIER 
        {
            if(fsymboltable[NFUNC].find($1)==fsymboltable[NFUNC].end()){
                vector<int> a; a.push_back(fsymboltable[NFUNC][$3].back());
                fsymboltable[NFUNC][$1] = a;
            }
            else{
                fsymboltable[NFUNC][$1].push_back(fsymboltable[NFUNC][$3].back());
            }
        }
        ; 





token: 
    STR      { printf("STR: %s\n", $1); }
    
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
    // | RETURN      { printf("RETURN: %s\n", $1); }
    | PARAM       { printf("PARAM: %s\n", $1); }
    | CALL        { printf("CALL: %s\n", $1); }
	| H 			{ printf("H: %s\n", $1); }
	// | OP 			{ printf("%s\n", $1); }
	// | CP			{ printf("%s\n", $1); }
    | EQ            { printf("%s\n", $1);}
    | RETVAL        { printf("RETVAL: %s\n", $1); }
    ;

%%

// Main function to start the parser
int main() {
    std::stringstream res;
        while (!stop_parsing) {
        yyparse();
    }
    res << " #include<iostream> using namespace std; " ;
    for (const auto& pair : globals) {
        
        std::cout << "global variable: " << pair.first << " = " << pair.second;
       std::cout << std::endl;
    }
    for (const auto& pair : symboltable) {
        res << "int " << pair.first << " = " ;
        std::cout << "Key: " << pair.first << " -> Values: ";
        int g = 0;
        for (int value : pair.second) {
            std::cout << value << " ";
            g = value;
        }
        res << g << ";" << endl;
        std::cout << std::endl;
    }
  for (const auto& pairc : functions) {
        std::cout << "function name: " << pairc.first << " = " << pairc.second<< endl;
        res << "int " << pairc.first << "() {" << endl;
    for (const auto& pair : fsymboltable[pairc.second]) {
        res << "int " << pair.first << " = " ;
        std::cout << "Key: " << pair.first << " -> Values: ";
        int g = 0;
        for (int value : pair.second) {
            std::cout << value << " ";
            g = value;
        }
        res << g << ";" << endl;
        std::cout << std::endl;
    }
    }
    string ress = res.str();
    cout << ress;
    return 0;
}

// Error handling function
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);

}