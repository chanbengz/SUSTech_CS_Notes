#include<cstdio>
#include<vector>
#include<queue>
using namespace std;
const int MAXN = 100005;
int n, m, t, s, ans[MAXN];
bool visited[MAXN];
vector<int> g[MAXN];

int main() {
    scanf("%d", &t);
    while(t--) {
        scanf("%d%d%d", &n, &m, &s);
        for(int i = 1; i <= n; i++) { ans[i] = -1; visited[i] = false; g[i].clear(); }
        for(int i = 0; i < m; i++) {
            int u, v;
            scanf("%d%d", &u, &v);
            g[u].push_back(v);
            g[v].push_back(u);
        }

        queue<int> q; q.push(s); visited[s] = true; ans[s] = 0;
        while(!q.empty()){
            int u = q.front(); q.pop();
            for(int i = 0; i < g[u].size(); i++) {
                int v = g[u][i];
                if(visited[v]) continue;
                ans[v] = ans[u] + 1;
                visited[v] = true;
                q.push(v);
            }
        }

        for(int i = 1; i <= n; i++) {
            printf("%d ", ans[i]);
        }
        printf("\n");
    }

    return 0;
}