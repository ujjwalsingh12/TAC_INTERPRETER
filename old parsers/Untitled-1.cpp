

#include <iostream>
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

map<string, vector<int>> symboltable;

map<int, map<string, vector<string>>> fsymboltable;

map<int, vector<string>> fparamtable;

queue<string> call_params;

string s = "";
int retval = 0;
vector<int> PARAMS(100, 0);
int NFUNC = -1;
int stop_parsing = 0;
int Ntemp = 0;
std::stringstream oss;

void createfunc(string fun) {
  NFUNC++;
  functions[fun.substr(0, fun.size() - 1)] =
      NFUNC;                // THIS WILL STORE THE ID OF FUNCTION
  functioncode[NFUNC] = ""; //
  unordered_map<string, vector<string>> table;
  fsymboltable[NFUNC] = table;
  vector<string> tt;
  fparamtable[NFUNC] = tt;
}

void createvarn(string x, string y) {
  if (symboltable.find(x) == symboltable.end()) {
    s = s + " int " + x + " = " + y + ";\n";
    vector<int> a;
    a.push_back(stoi(y));
    symboltable[x] = a;
  } else {
    s = s + x + " = " + y + ";\n";
    symboltable[x].push_back(stoi(y));
  }
}
void createvar(string x, string y) {
  if (symboltable.find(x) == symboltable.end()) {
    s = s + " int " + x + " = " + y + ";\n";
    vector<int> a;
    a.push_back(symboltable[y].back());
    symboltable[x] = a;
  } else {
    s = s + x + " = " + y + ";\n";
    symboltable[x].push_back(symboltable[y].back());
  }
}
void fcreatevar(int id, string x, string y) {
  if (fsymboltable[id].find(x) == fsymboltable[id].end()) {
    s = s + " int " + x + " = " + y + ";\n";
    vector<string> a;
    a.push_back(y);
    fsymboltable[id][x] = a;
  } else {
    s = s + x + " = " + y + ";\n";
    fsymboltable[id][x].push_back(y);
  }
}
void fcreatevarn(int id, string x, string y) {
  if (fsymboltable[id].find(x) == fsymboltable[id].end()) {
    s = s + " int " + x + " = " + y + ";\n";
    vector<string> a;
    a.push_back(y);
    fsymboltable[id][x] = a;
  } else {
    s = s + x + " = " + y + ";\n";
    fsymboltable[id][x].push_back(y);
  }
}
void fcreateparam(int id, string x) {
  // s = s + x + " = " + y +",\n";
  string g = "int " + x;

  fparamtable[id].push_back(g);
}