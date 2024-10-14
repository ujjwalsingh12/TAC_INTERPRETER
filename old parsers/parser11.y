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

unordered_map<int,unordered_map<string,vector<string> > > fsymboltable;

unordered_map<int,vector<string> > fparamtable;

queue<string> call_params;

string s = "";
int retval = 0;
vector<int> PARAMS(100,0);
int NFUNC = -1;
int stop_parsing = 0;
int Ntemp = 0;
std::stringstream oss;

void createfunc(string fun){
    NFUNC++;
    functions[fun.substr(0,fun.size()-1)] = NFUNC; // THIS WILL STORE THE ID OF FUNCTION
    functioncode[NFUNC] = ""; //
    unordered_map<string,vector<string> > table;
    fsymboltable[NFUNC] = table;
    vector<string> tt;
    fparamtable[NFUNC] = tt;
    
}

void createvarn(string x,string y){
     if(symboltable.find(x)==symboltable.end()){
                s = s + " int " + x + " = " + y +";\n";
                vector<int> a; a.push_back(stoi(y));
                symboltable[x] = a;
            }
            else{
                s = s + x + " = " + y +";\n";
                symboltable[x].push_back(stoi(y));
            }
}
void createvar(string x,string y){
        if(symboltable.find(x)==symboltable.end()){
        s = s + " int " + x + " = " + y +";\n";
        vector<int> a; a.push_back(symboltable[y].back());
        symboltable[x] = a;
    }
    else{
        s = s + x + " = " + y +";\n";
        symboltable[x].push_back(symboltable[y].back());
    }
}
void fcreatevar(int id,string x,string y){
        if(fsymboltable[id].find(x)==fsymboltable[id].end() ){
        s = s + " int " + x + " = " + y +";\n";
        vector<string> a; a.push_back(y);
        fsymboltable[id][x] = a;
    }
    else{
        s = s + x + " = " + y +";\n";
        fsymboltable[id][x].push_back(y);
    }
}
void fcreatevarn(int id,string x,string y){
     if(fsymboltable[id].find(x)==fsymboltable[id].end()){
                s = s + " int " + x + " = " + y +";\n";
                vector<string> a; a.push_back(y);
                fsymboltable[id][x] = a;
            }
            else{
                s = s + x + " = " + y +";\n";
                fsymboltable[id][x].push_back(y);
            }
}
void fcreateparam(int id,string x){
        // s = s + x + " = " + y +",\n";
        string g = "int "+x;
        
        fparamtable[id].push_back(g);
}

%}

%union {
    char *str;
}

// Define decls
%token <str> RETVAL GLOBAL STR EQ ENDD IDENTIFIER F_IDENTIFIER NUMBER TEMPORARY LABEL GOTO GOTO_LABEL IF RETURN PARAM CALL H OP CP

%%






//--------------------------
start 		: program 
//--------------------------
program 	: globals functions
			| ENDD  { printf("Ending...\n");stop_parsing = 1;YYABORT;}
			;
//--------------------------
globals 	: globaldecl globals   
			| ;
//--------------------------
globaldecl 	: GLOBAL IDENTIFIER 
			| TEMPORARY  EQ NUMBER {createvarn($1,$3);}
			| TEMPORARY  EQ TEMPORARY {createvar($1,$3);}
			| IDENTIFIER EQ TEMPORARY {createvar($1,$3);}
			;
//--------------------------
functions 	: F_IDENTIFIER {createfunc($1);} decls RETURN 
			| ;
//--------------------------
decls 	:   paramdecls fundecls retvaldecl 
			| ; 
//--------------------------	
paramdecls 	: paramdecl paramdecls 
			| ; 
//--------------------------
paramdecl 	: IDENTIFIER EQ PARAM {fcreateparam(NFUNC,$1);}
            ;
//--------------------------
fundecls 	: fundecl fundecls 
			| ; 
//--------------------------
fundecl 	: assignmt
			| func_call
			| opral
			| GOTO GOTO_LABEL {oss << $1 << " " << $2 << endl; functioncode[NFUNC]+=oss.str();oss.clear();}
			| LABEL {oss << $1 << " " <<endl; functioncode[NFUNC]+=oss.str();oss.clear();}
            ;
//--------------------------
assignmt    : direct
			| indirect
            ;
//--------------------------
direct      : IDENTIFIER EQ TEMPORARY {fcreatevar(NFUNC,$1,$3);}
			| TEMPORARY  EQ NUMBER {fcreatevarn(NFUNC,$1,$3);}
			| TEMPORARY	 EQ TEMPORARY {fcreatevar(NFUNC,$1,$3);}
			| TEMPORARY  EQ IDENTIFIER {fcreatevar(NFUNC,$1,$3);}
			;
//--------------------------
indirect    : TEMPORARY EQ exps 
{
    string callers = "";
    callers = $1;
    callers = callers + " = ";
    while(!call_params.empty()){
        string par = call_params.front();
        call_params.pop();
        callers = callers + par + " ";
    }
    callers[callers.size()-1] = ';';
    functioncode[NFUNC] += callers;
    // cout << callers << endl;
}
            ;
//--------------------------
exps :  exp | ;
//--------------------------
exp : opr opr opr | ;
//--------------------------
opr   : IDENTIFIER{call_params.push($1);}
        | H{call_params.push($1);}
        | NUMBER{call_params.push($1);}
		;
//--------------------------
opral : IF OP TEMPORARY CP GOTO GOTO_LABEL {oss << "if ( "<<$3<<") goto "<<$6<<";"; functioncode[NFUNC]+=oss.str();oss.clear();}
      ;
//--------------------------
func_call   : func_parms caller
//--------------------------
caller : CALL IDENTIFIER 
{
    string callers = "";
    callers = $2;
    callers = callers + "(";
    while(!call_params.empty()){
        string par = call_params.front();
        call_params.pop();
        callers = callers + par + ",";
    }
    callers[callers.size()-1] = ')';
    callers = callers + ";";
    functioncode[NFUNC] += callers;
    cout << callers << endl;
}
			;
//--------------------------
func_parms  : func_parm func_parms | func_parm ;
//--------------------------
func_parm   : PARAM      EQ TEMPORARY {call_params.push($3);}
			| PARAM      EQ IDENTIFIER {call_params.push($3);}
            | ;
//--------------------------
retvaldecl 	: RETVAL EQ TEMPORARY 
			| RETVAL EQ IDENTIFIER
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
        res << "int " << pairc.first << "(";
        for(int i =0;i<fparamtable[pairc.second].size();i++){
            res << fparamtable[pairc.second][i];
            if(i<fparamtable[pairc.second].size()-1) res << ",";
        }
        res << ") {" << endl;
    for (const auto& pair : fsymboltable[pairc.second]) {
        res << "int " << pair.first << " = " ;
        std::cout << "Key: " << pair.first << " -> Values: ";
        string g = "";
        for (string value : pair.second) {
            std::cout << value << " ";
            g = value;
        }
        res << g << ";" << endl;
        res << pair.second.back() << ";" << endl;
        std::cout << std::endl;
    }
    }
    string ress = res.str();
    cout << ress;
    cout << "\n-------------------------\n";
    cout << s;
    return 0;
}

// Error handling function
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);

}