#include <iostream>
#include <vector>
#include <algorithm>
#include <sstream>
using namespace std;

int n;
vector<string> ans;

struct interval {
    int start = 0, end = 0;
    string name;
} intervals[10000];

bool cmp(const interval &a, const interval &b) {
    return a.end < b.end;
}

int main() {
    string line;
    while(getline(cin, line)) {
        istringstream iss(line);
        iss >> intervals[++n].name;
        iss >> intervals[n].start >> intervals[n].end;
    }

    sort(intervals + 1, intervals + 1 + n, cmp);
    int ed = intervals[1].end;
    ans.push_back(intervals[1].name);

    for (int i = 1; i <= n; i++) {
        if (intervals[i].start >= ed) {
            ans.push_back(intervals[i].name);
            ed = intervals[i].end;
        }
    }

    for (string i: ans) cout << i << ' ';
    cout << endl;

    return 0;
}
