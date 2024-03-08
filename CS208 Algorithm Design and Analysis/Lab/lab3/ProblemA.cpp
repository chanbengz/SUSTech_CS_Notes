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

typedef struct file {
    string name;
    string content;
} file;

typedef struct file_tree {
    string name;
    vector<file_tree> folders;
    vector<file> files;
} file_tree;

file_tree root;

vector<string> split(string s)
{
    vector<string> res;
    string word = "";
    for (int i = 0; i < s.size(); i++) {
        if (s[i] == '/') { res.push_back(word); word = ""; }
        else { word += s[i]; }
    }
    if (word != "") res.push_back(word);
    return res;
}

file_tree *find_folder(vector<string> path)
{
    file_tree *cur = &root;
    stack<file_tree *> st;
    for (int i = 0; i < path.size() - 1; i++) {
        if (path[i] == ".") { continue; }
        else if (path[i] == "..") { cur = st.top(); st.pop(); continue; }
        for (int j = 0; j < cur->folders.size(); j++) {
            if (cur->folders[j].name == path[i]) {
                st.push(cur);
                cur = &cur->folders[j];
            }
        }
    }
    return cur;
}

void echo(vector<string> paras)
{
    string content; vector<string> path;
    for (int i = 1; i < paras.size(); i++) {
        if (paras[i] != ">") { content += paras[i] + (paras[i + 1] == ">" ? "" : " "); }
        else { path = split(paras[i + 1]); break; }
    }
    file_tree *cur = find_folder(path);
    file new_file;
    new_file.name = path[path.size() - 1];
    new_file.content = content;
    cur->files.push_back(new_file);
}

void mkdir(vector<string> paras)
{
    vector<string> path = split(paras[1]);
    file_tree *cur = find_folder(path);
    file_tree new_folder;
    new_folder.name = path[path.size() - 1];
    cur->folders.push_back(new_folder);
}

void rm(vector<string> paras)
{
    bool folder = false;
    vector<string> path;
    if (paras.size() == 2) path = split(paras[1]);
    else { path = split(paras[2]); folder = true; }
    file_tree *cur = find_folder(path);

    if (folder) {
        for (int j = 0; j < cur->folders.size(); j++) {
            if (cur->folders[j].name == path[path.size() - 1]) {
                cur->folders.erase(cur->folders.begin() + j);
                return;
            }
        }
    }
    for (int j = 0; j < cur->files.size(); j++) {
        if (cur->files[j].name == path[path.size() - 1]) {
            cur->files.erase(cur->files.begin() + j);
            return;
        }
    }
}

void mv(vector<string> paras)
{
    vector<string> src_path = split(paras[1]);
    file_tree *src = find_folder(src_path);
    vector<string> dst_path = split(paras[2]);
    file_tree *dst = find_folder(dst_path);
    for (int i = 0; i < dst->folders.size(); i++) {
        if (dst->folders[i].name == dst_path[dst_path.size() - 1]) {
            dst = &dst->folders[i];
            break;
        }
    }
    for (int i = 0; i < src->files.size(); i++) {
        if (src->files[i].name == src_path[src_path.size() - 1]) {
            dst->files.push_back(src->files[i]);
            src->files.erase(src->files.begin() + i);
            return;
        }
    }
}

void cat(vector<string> paras)
{
    vector<string> path = split(paras[1]);
    file_tree *cur = find_folder(path);
    for (int j = 0; j < cur->files.size(); j++) {
        if (cur->files[j].name == path[path.size() - 1]) {
            cout << cur->files[j].content << endl;
            return;
        }
    }
}

vector<string> find_res;
string target, type;

void print_tree(file_tree *cur, string prefix)
{
    if (target == "" && type == "" && cur == &root) find_res.push_back(prefix + cur->name);
    for (int i = 0; i < cur->folders.size(); i++) {
        if ((type == "d" || type == "") && (cur->folders[i].name == target || target == "")) {
            find_res.push_back(prefix + cur->name + "/" + cur->folders[i].name);
        }
        print_tree(&cur->folders[i], prefix + cur->name + "/");
    }
    for (int i = 0; i < cur->files.size(); i++) {
        if ((type == "f" || type == "") && (cur->files[i].name == target || target == "")) {
            find_res.push_back(prefix + cur->name + "/" + cur->files[i].name);
        }
    }
}

void find(vector<string> paras)
{
    find_res.clear(); target = type = "";
    vector<string> path = {"."};

    for(int i = 1; i < paras.size(); i++) {
        if (paras[i] == "-name") { target = paras[++i]; }
        else if (paras[i] == "-type") { type = paras[++i]; }
        else { path = split(paras[i]); }
    }
    file_tree *cur = find_folder(path);
    for (int i = 0; i < cur->folders.size(); i++) {
        if (cur->folders[i].name == path[path.size() - 1]) { cur = &cur->folders[i]; break; }
    }

    string prefix = "";
    if (target != "" || type != "") for (int i = 0; i < path.size() - 1; i++) { prefix += path[i] + "/"; }
    print_tree(cur, prefix);

    cout << find_res.size() << endl;
    for (int i = 0; i < find_res.size(); i++) { cout << find_res[i] << endl; }
}

void process()
{
    getline(cin, line);
    if (line == "") return;
    std::istringstream iss(line);
    std::vector<string> words;
    while (iss >> word) { words.push_back(word); }
    if (words[0] == "echo") { echo(words); }
    else if (words[0] == "mkdir") { mkdir(words); }
    else if (words[0] == "rm") { rm(words); }
    else if (words[0] == "mv") { mv(words); }
    else if (words[0] == "cat") { cat(words); }
    else if (words[0] == "find") { find(words); }
}

int main()
{
    std::ios::sync_with_stdio(false);
    cin >> n >> m;
    root.name = ".";
    getline(cin, line);
    for (int i = 0; i < n; i++) { process(); }
    for (int i = 0; i < m; i++) { process(); }

    return 0;
}
