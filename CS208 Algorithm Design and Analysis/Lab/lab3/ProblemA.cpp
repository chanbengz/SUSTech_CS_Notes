#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <stack>
using std::cin;    using std::cout;
using std::endl;   using std::vector;
using std::string; using std::stack;
int n, m; string line, word;

class file {
public:
    string name, content;
};

class file_tree {
public:
    string name;
    vector<file *> files;
    vector<file_tree *> folders;
};

file_tree root;

vector<string> split(string s)
{
    vector<string> res; string tmp = "";
    for (int i = 0; i < s.size(); i++) {
        if (s[i] == '/') { res.push_back(tmp); tmp = ""; }
        else { tmp += s[i]; }
    }
    if (tmp != "") res.push_back(tmp);
    return res;
}

file_tree *find_folder(vector<string> path, bool prev = true)
{
    file_tree *cur = &root;
    stack<file_tree *> st;
    for (int i = 0; i < path.size() - prev; i++) {
        if (path[i] == ".") { continue; }
        else if (path[i] == "..") { cur = st.top(); st.pop(); continue; }
        for (int j = 0; j < cur->folders.size(); j++) {
            if (cur->folders[j]->name == path[i]) {
                st.push(cur);
                cur = cur->folders[j];
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
    file *new_file = new file();
    new_file->name = path[path.size() - 1];
    new_file->content = content;
    cur->files.push_back(new_file);
}

void mkdir(vector<string> paras)
{
    vector<string> path = split(paras[1]);
    file_tree *cur = find_folder(path);
    file_tree *new_folder = new file_tree();
    new_folder->name = path[path.size() - 1];
    cur->folders.push_back(new_folder);
}

void rm(vector<string> paras)
{
    bool folder = false; vector<string> path;
    for (int i = 1; i < paras.size(); i++) {
        if (paras[i] == "-rf") { folder = true; }
        else { path = split(paras[i]); }
    }
    file_tree *cur = find_folder(path);

    if (folder) {
        for (int j = 0; j < cur->folders.size(); j++) {
            if (cur->folders[j]->name == path[path.size() - 1]) {
                delete cur->folders[j];
                cur->folders.erase(cur->folders.begin() + j); break;
            }
        }
    } else {
        for (int j = 0; j < cur->files.size(); j++) {
            if (cur->files[j]->name == path[path.size() - 1]) {
                delete cur->files[j];
                cur->files.erase(cur->files.begin() + j); break;
            }
        }
    }
}

void mv(vector<string> paras)
{
    vector<string> src_path = split(paras[1]);
    file_tree *src = find_folder(src_path);
    vector<string> dst_path = split(paras[2]);
    file_tree *dst = find_folder(dst_path, false);
    for (int i = 0; i < src->files.size(); i++) {
        if (src->files[i]->name == src_path[src_path.size() - 1]) {
            dst->files.push_back(src->files[i]);
            src->files.erase(src->files.begin() + i); break;
        }
    }
    for (int i = 0; i < src->folders.size(); i++) {
        if (src->folders[i]->name == src_path[src_path.size() - 1]) {
            dst->folders.push_back(src->folders[i]);
            src->folders.erase(src->folders.begin() + i); break;
        }
    }
}

void cat(vector<string> paras)
{
    vector<string> path = split(paras[1]);
    file_tree *cur = find_folder(path);
    for (int j = 0; j < cur->files.size(); j++) {
        if (cur->files[j]->name == path[path.size() - 1]) {
            cout << cur->files[j]->content << endl;
            return;
        }
    }
}

vector<string> find_res;
string target, type;

// prefix ends with '/'
void print_tree(file_tree *cur, string prefix)
{
    for (int i = 0; i < cur->files.size(); i++) {
        if ((type == "" || type == "f") && (target == "" || target == cur->files[i]->name)) {
            find_res.push_back(prefix + cur->files[i]->name);
        }
    }
    for (int i = 0; i < cur->folders.size(); i++) {
        if ((type == "" || type == "d") && (target == "" || target == cur->folders[i]->name)) {
            find_res.push_back(prefix + cur->folders[i]->name);
        }
        print_tree(cur->folders[i], prefix + cur->folders[i]->name + "/");
    }
}

void find(vector<string> paras)
{
    find_res.clear(); target = type = "";
    vector<string> path = {"."};
    file_tree *cur; string prefix;
    for(int i = 1; i < paras.size(); i++) {
        if (paras[i] == "-name") { target = paras[++i]; }
        else if (paras[i] == "-type") { type = paras[++i]; }
        else { path = split(paras[i]); prefix = paras[i]; }
    }

    if (prefix == "") {
        cur = &root; prefix = "./";
        if ((type == "d" || type == "") && target == "") { find_res.push_back(cur->name); }
    } else {
        prefix += prefix[prefix.length() - 1] != '/' ? "/" : "";
        cur = find_folder(path, false);
    }
    print_tree(cur, prefix);

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
    cin >> n >> m;
    root.name = ".";
    getline(cin, line);
    for (int i = 0; i < n; i++) { process(); }
    for (int i = 0; i < m; i++) { process(); }

    return 0;
}
