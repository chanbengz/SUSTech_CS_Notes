#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

const int MAXN = 105;
int n, m, w[MAXN];

struct node {
    int in_deg;
    vector<int> next;
    vector<int> weight;
} nodes[MAXN];

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n >> m;
    for(int i = 1; i <= n; i++) cin >> w[i];
    for(int i = 1, u, v; i <= m; i++) {
        cin >> u >> v;
        nodes[u].next.push_back(v);
        nodes[u].weight.push_back(w[v]);
        nodes[v].in_deg++;
    }

    return 0;
}