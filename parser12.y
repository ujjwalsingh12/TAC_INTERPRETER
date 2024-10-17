 %{

#include <iostream>
#include <map>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>
using namespace std;
// Define external yylex function from Lex
int yylex();
void yyerror(const char *s);

map<string, int> globals;

map<string, int> functions;

map<int, string> functioncode;

map<string, vector<int> > symboltable;

map<int, map<string, vector<string> > > fsymboltable;

map<int, vector<string> > fparamtable;

queue<string> call_params;

string s = "";
int retval = 0;
vector<int> PARAMS(100, 0);
int NFUNC = -1;
int stop_parsing = 0;
int Ntemp = 0;
// std::stringstream oss;
string temp;
string print_string;

void createfunc(string fun) {
    NFUNC++;
    functions[fun.substr(0, fun.size() - 1)] = NFUNC;  // THIS WILL STORE THE ID OF FUNCTION
    functioncode[NFUNC] = "";                          //
    map<string, vector<string> > table;
    fsymboltable[NFUNC] = table;
    vector<string> tt;
    fparamtable[NFUNC] = tt;
}

void createvarn(string x, string y) {
    if (symboltable.find(x) == symboltable.end()) {
        string s = s + "" + x + " = " + y + ";\n";
        functioncode[NFUNC] += s;
        vector<int> a;
        a.push_back(stoi(y));
        symboltable[x] = a;
    } else {
        string s = s + x + " = " + y + ";\n";
        functioncode[NFUNC] += s;
        symboltable[x].push_back(stoi(y));
    }
}
void createvar(string x, string y) {
    if (symboltable.find(x) == symboltable.end()) {
        string s = s + "" + x + " = " + y + ";\n";
        functioncode[NFUNC] += s;
        vector<int> a;
        a.push_back(symboltable[y].back());
        symboltable[x] = a;
    } else {
        string s = s + x + " = " + y + ";\n";
        functioncode[NFUNC] += s;
        symboltable[x].push_back(symboltable[y].back());
    }
}
void fcreatevar(int id, string x, string y) {
    if (fsymboltable[id].find(x) == fsymboltable[id].end()) {
        string s = s + "" + x + " = " + y + ";\n";
        functioncode[NFUNC] += s;
        vector<string> a;
        a.push_back(y);
        fsymboltable[id][x] = a;
    } else {
        string s = s + x + " = " + y + ";\n";
        functioncode[NFUNC] += s;
        fsymboltable[id][x].push_back(y);
    }
}
void fcreatevarn(int id, string x, string y) {
    if (fsymboltable[id].find(x) == fsymboltable[id].end()) {
        string s = s + "" + x + " = " + y + ";\n";
        functioncode[NFUNC] += s;
        vector<string> a;
        a.push_back(y);
        fsymboltable[id][x] = a;
    } else {
        string s = s + x + " = " + y + ";\n";
        functioncode[NFUNC] += s;
        fsymboltable[id][x].push_back(y);
    }
}
void fcreateparam(int id, string x) {
    // s = s + x + " = " + y +",\n";
    string g = "int " + x;

    fparamtable[id].push_back(g);
}


%}

%union {
    char *str;
}

// Define decls
%token <str> PRINTF RETVAL GLOBAL STR EQ ENDD IDENTIFIER F_IDENTIFIER NUMBER TEMPORARY LABEL GOTO GOTO_LABEL IF RETURN PARAM CALL H OP CP

%%






//--------------------------
start 		: program 
//--------------------------
program 	: globals functions
			| ENDD  { stop_parsing = 1;YYABORT;}
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
functions 	: functions function
			| ;
//--------------------------
function 	: F_IDENTIFIER {createfunc($1);} decls 
			| ;
//--------------------------
decls 	:   paramdecls fundecls 
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
			| GOTO GOTO_LABEL {stringstream oss; oss << $1 << " " << $2 << ";"<< endl; functioncode[NFUNC]+=oss.str();oss.clear();}
			| LABEL {stringstream oss; oss << $1 << " " <<endl; functioncode[NFUNC]+=oss.str();oss.clear();}
            | RETURN {functioncode[NFUNC]+="\nreturn retval;\n";}
            ;
//--------------------------
assignmt    : direct
			| indirect
            ;
//--------------------------
direct      : IDENTIFIER EQ TEMPORARY {fcreatevar(NFUNC,$1,$3);}
			| TEMPORARY  EQ NUMBER {fcreatevarn(NFUNC,$1,$3);}
			| IDENTIFIER  EQ NUMBER {fcreatevarn(NFUNC,$1,$3);}
			| TEMPORARY	 EQ TEMPORARY {fcreatevar(NFUNC,$1,$3);}
			| TEMPORARY  EQ IDENTIFIER {fcreatevar(NFUNC,$1,$3);}
            | TEMPORARY EQ RETVAL {fcreatevar(NFUNC,$1,$3);}
            | IDENTIFIER EQ RETVAL {fcreatevar(NFUNC,$1,$3);}
            | TEMPORARY EQ STR {call_params.push($3);/*stringstream p;p<<$3; print_string = p.str();*/}
			;
//--------------------------
indirect    : TEMPORARY EQ exps 
{
    fcreatevar(NFUNC,$1,"0");
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
            | RETVAL EQ exps 
{
    // fcreatevar(NFUNC,$1,"0");
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
}
            | RETVAL EQ exps
{
    // fcreatevar(NFUNC,$1,"0");
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
            | RETVAL EQ exps 
{
    // fcreatevar(NFUNC,$1,"0");
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
}
            ;
//--------------------------
exps :  exp | ;
//--------------------------
exp : opr opr opr | opr;
//--------------------------
opr   : IDENTIFIER{call_params.push($1);}
        | H{call_params.push($1);}
        | NUMBER{call_params.push($1);}
        | TEMPORARY{call_params.push($1);}
        | RETVAL{call_params.push($1);}
		;
//--------------------------
opral : IF OP TEMPORARY CP GOTO GOTO_LABEL {stringstream osss; osss << "if ( "<<$3<<") goto "<<$6<<";"; functioncode[NFUNC]+=osss.str();osss.clear();}
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
    // cout << callers << endl;
}
    | CALL PRINTF
{
    string callers = "printf(";
    int count = 0;
    while(!call_params.empty()){
        if(count==1) call_params.pop();
        string par = call_params.front();
        count++;
        call_params.pop();
        callers = callers + par + ",";
    }
    callers[callers.size()-1] = ')';
    callers = callers + ";";
    functioncode[NFUNC] += callers;
    // cout << callers << endl;

    // string callers = "";
    // callers = $2;
    // callers = callers + "(";
    // callers += "\nprintf("+print_string+"\n";
    // while(!call_params.empty()){
    //     string par = call_params.front();
    //     call_params.pop();
    //     callers = callers + par + ",";
    // }
    // callers[callers.size()-1] = ')';
    // callers = callers + ";";
    // functioncode[NFUNC] += callers;
    // cout << callers << endl;
}
			;
//--------------------------
func_parms  : func_parm func_parms | func_parm ;
//--------------------------
func_parm   : PARAM      EQ TEMPORARY {call_params.push($3);}
			| PARAM      EQ IDENTIFIER {call_params.push($3);}
            | PARAM      EQ NUMBER {call_params.push($3);}
            | ;
//--------------------------



%%

// Main function to start the parser
int main() {
    std::stringstream res;
    while (!stop_parsing) {
        yyparse();
    }
    res << "#include<iostream> \nusing namespace std;\nint retval=0;\n";  ///////  R E S S

    // for (const auto& pair : globals) {

    //     std::cout << "global variable: " << pair.first << " = " << pair.second;
    //    std::cout << std::endl;
    // } //only prints global variables for DEBUGGGIGNGGGG

    for (const auto& pair : symboltable) {
        res << "int " << pair.first << " = ";  ///////  R E S S
        // std::cout << "Key: " << pair.first << " -> Values: ";
        int g = 0;
        for (int value : pair.second) {
            std::cout << value << " ";
            g = value;
        }
        res << g << ";" << endl;  ///////  R E S S
        std::cout << std::endl;
    }  ///////////////////////////////////////////// D E B U G G I N G

    for (const auto& pairc : functions) {
        // std::cout << "function name: " << pairc.first << " = " << pairc.second<< endl; //// D E B U G G I N G
        if(pairc.first != "main")
        {
            res << "int " << pairc.first << "(";  ///////  R E S S   function declaration
            for (int i = 0; i < fparamtable[pairc.second].size(); i++) {
                res << fparamtable[pairc.second][i];                       ///////  R E S S   function params
                if (i < fparamtable[pairc.second].size() - 1) res << ",";  ///////  R E S S   same
            }
            res << ") {" << endl;  ///////  R E S S      main body starts
            for (const auto& pair : fsymboltable[pairc.second]) {
                res << "int " << pair.first << " = 0";  ///////  R E S S
                                                        //   std::cout << "Key: " << pair.first << " -> Values: ";  //// D E B U G G I N G
                string g = "";
                //   for (string value : pair.second) {
                //       std::cout << value << " ";
                //       g = value;
                //   }
                res << g << ";" << endl;  ///////  R E S S
                //   res << pair.second.back() << ";" << endl;    ///////  R E S S
                //   std::cout << std::endl;
            }
            res << functioncode[pairc.second];
            res << "}" << endl;
        }
    }
    for (const auto& pairc : functions) {
        // std::cout << "function name: " << pairc.first << " = " << pairc.second<< endl; //// D E B U G G I N G
        if(pairc.first == "main")
        {
            res << "int " << pairc.first << "(";  ///////  R E S S   function declaration
            for (int i = 0; i < fparamtable[pairc.second].size(); i++) {
                res << fparamtable[pairc.second][i];                       ///////  R E S S   function params
                if (i < fparamtable[pairc.second].size() - 1) res << ",";  ///////  R E S S   same
            }
            res << ") {" << endl;  ///////  R E S S      main body starts
            for (const auto& pair : fsymboltable[pairc.second]) {
                res << "int " << pair.first << " = 0";  ///////  R E S S
                                                        //   std::cout << "Key: " << pair.first << " -> Values: ";  //// D E B U G G I N G
                string g = "";
                //   for (string value : pair.second) {
                //       std::cout << value << " ";
                //       g = value;
                //   }
                res << g << ";" << endl;  ///////  R E S S
                //   res << pair.second.back() << ";" << endl;    ///////  R E S S
                //   std::cout << std::endl;
            }
            res << functioncode[pairc.second];
            res << "}" << endl;
        }
    }

    string ress = res.str();
    cout << ress;
    // cout << s;
    return 0;
}

// Error handling function
void yyerror(const char* s) { fprintf(stderr, "Error: %s\n", s); }