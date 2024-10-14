void fcreatevar(int id, string x, string y)
{
    if (fsymboltable[id].find(x) == fsymboltable[id].end())
    {
        s = s + " int " + x + " = " + y + ";\n";
        vector<int> a; a.push_back(fsymboltable[id][y].back());
        fsymboltable[id][x] = a;
    }
    else
    {
        s = s + x + " = " + y + ";\n";
        fsymboltable[id][x].push_back(fsymboltable[id][y].back());
    }
}
void fcreatevarn(int id, string x, string y)
{
    if (fsymboltable[id].find(x) == fsymboltable[id].end())
    {
        s = s + " int " + x + " = " + y + ";\n";
        vector<int> a; a.push_back(stoi(y));
        fsymboltable[id][x] = a;
    }
    else
    {
        s = s + x + " = " + y + ";\n";
        fsymboltable[id][x].push_back(stoi(y));
    }
}