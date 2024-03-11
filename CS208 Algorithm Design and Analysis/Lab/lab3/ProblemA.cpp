#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <stack>
using std::cin;
using std::cout;
using std::endl;
using std::vector;
using std::string;
using std::stack;
int n, m; string line, word;

class file_tree {
public:
    file_tree(string name = ".",
              string content = "",
              bool is_file = false)
    :name(name), content(content), is_file(is_file) {}
    bool is_file = false;
    string name, content;
    vector<file_tree *> files;
};

file_tree root;

vector<string> split(string s)
{
    vector<string> res; string tmp = "";
    for (int i = 0; i < s.size(); i++) {
        if (s[i] == '/' && tmp != "") { res.push_back(tmp); tmp = ""; }
        else { tmp += s[i]; }
    }
    if (tmp != "") res.push_back(tmp);
    return res;
}

file_tree *find_folder(vector<string> path, bool prev = true)
{
    file_tree *cur = &root; stack<file_tree *> st;
    for (int i = 0; i < path.size() - prev; i++) {
        if (path[i] == ".") { continue; }
        else if (path[i] == "..") { cur = st.top(); st.pop(); continue; }
        for (auto &j : cur->files) {
            if (j->name == path[i]) {
                st.push(cur); cur = j; break;
            }
        }
    }
    return cur;
}

void echo(vector<string> paras)
{
    string content = ""; vector<string> path;
    for (int i = 1; i < paras.size(); i++) {
        if (paras[i] != ">") { content += paras[i] + (paras[i + 1] == ">" ? "" : " "); }
        else { path = split(paras[i + 1]); break; }
    }
    file_tree *cur = find_folder(path);
    file_tree *new_file = new file_tree(path.back(), content, true);
    cur->files.push_back(new_file);
}

void mkdir(vector<string> paras)
{
    vector<string> path = split(paras[1]);
    file_tree *cur = find_folder(path);
    file_tree *new_folder = new file_tree(path.back(), "", false);
    cur->files.push_back(new_folder);
}

void rm(vector<string> paras)
{
    vector<string> path;
    for (int i = 1; i < paras.size(); i++) {
        if (paras[i] != "-rf") { path = split(paras[i]); }
    }
    file_tree *cur = find_folder(path);
    for (int j = 0; j < cur->files.size(); j++) {
        if (cur->files[j]->name == path[path.size() - 1]) {
            delete cur->files[j];
            cur->files.erase(cur->files.begin() + j); break;
        }
    }
}

void mv(vector<string> paras)
{
    vector<string> path = split(paras[1]);
    file_tree *src = find_folder(path);
    file_tree *dst = find_folder(split(paras[2]), false);
    for (int i = 0; i < src->files.size(); i++) {
        if (src->files[i]->name == path.back()) {
            dst->files.push_back(src->files[i]);
            src->files.erase(src->files.begin() + i); return;
        }
    }
}

void cat(vector<string> paras)
{
    vector<string> path = split(paras[1]);
    file_tree *cur = find_folder(path);
    for (auto &i : cur->files) {
        if (i->name == path.back() && i->is_file) {
            cout << i->content << endl; return;
        }
    }
    cout << "" << endl;
}

vector<string> find_res;
string target, type;

void print_tree(file_tree *cur, string prefix)
{
    if (cur == nullptr) return;
    bool found = true;
    if (type == "f" && !cur->is_file)        { found = false; }
    if (type == "d" && cur->is_file)         { found = false; }
    if (target != "" && cur->name != target) { found = false; }
    if (found) find_res.push_back(prefix);
    for (auto &i : cur->files) {
        print_tree(i, prefix + "/" + i->name);
    }
}

void find(vector<string> paras)
{
    find_res.clear(); target = type = "";
    string prefix = paras.size() > 1 && paras[1].front() != '-' ? paras[1] : ".";
    vector<string> path = split(prefix);
    for(int i = 1; i < paras.size(); i++) {
        if (paras[i] == "-name") { target = paras[++i]; }
        else if (paras[i] == "-type") { type = paras[++i]; }
    }
    prefix.back() == '/' ? prefix.pop_back() : void();
    print_tree(find_folder(path, false), prefix);
    cout << find_res.size() << endl;
    for (int i = 0; i < find_res.size(); i++) { cout << find_res[i] << endl; }
}

void process()
{
    getline(cin, line); if (line == "") return;
    std::istringstream iss(line); vector<string> paras;
    while (iss >> word) { paras.push_back(word); }
    if (paras[0] == "echo") { echo(paras); }
    else if (paras[0] == "mkdir") { mkdir(paras); }
    else if (paras[0] == "rm") { rm(paras); }
    else if (paras[0] == "mv") { mv(paras); }
    else if (paras[0] == "cat") { cat(paras); }
    else if (paras[0] == "find") { find(paras); }
}

int main()
{
    std::ios::sync_with_stdio(false);
    cin >> n >> m; cin.ignore();
    for (int i = 0; i < n + m; i++) { process(); }
    return 0;
}
