#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int n, m, cnt, c[100010], ans[100010];
priority_queue<int, vector<int>, greater<int> > q;
vector<int> g[100005];

int main()
{
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n >> m;

    for(int i = 0; i < m; i++) {
        int u, v; cin >> u >> v;
        g[u].push_back(v); c[v]++;
    }

    for(int i = 1; i <= n; i++) {
        if(c[i] == 0) q.push(i);
    }

    while(!q.empty()) {
        int u = q.top(); q.pop();
        ans[++cnt] = u;
        for(int i = 0; i < g[u].size(); i++){
            if(c[g[u][i]] == 1) q.push(g[u][i]);
            c[g[u][i]]--;
        }
    }

    if(cnt == n) {
        for(int i = 1; i <= n; i++) cout << ans[i] << " ";
        cout << endl;
    } else cout << "impossible" << endl;

    return 0;
}