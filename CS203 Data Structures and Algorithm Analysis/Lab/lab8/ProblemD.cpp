#include<cstdio>
#include<vector>
#include<cmath>
using namespace std;
const int MAXN = 150005;
int t, n, m, dfn[MAXN], siz[MAXN], pos;
vector<int> g[MAXN]; bool fa[MAXN], vis[MAXN];

inline int read(){
    register int x = 0, t = 1;
    register int ch = getchar();
    while(ch < '0' || ch > '9'){
        if(ch == '-') t = -1;
        ch = getchar();
    }
    while(ch >= '0' && ch <= '9'){
        x = (x << 1) + (x << 3) + (ch ^ 48);
        ch = getchar();
    }
    return x * t;
}

void dfs(int u) {
    dfn[u] = ++pos;
    for(int i = 0; i < g[u].size(); i++) {
        int v = g[u][i];
        if(vis[v]) continue;
        vis[v] = true;
        dfs(v);
        siz[u] += siz[v];
    }
}

int main() {
    t = read();
    while(t--) {
        int n = read(), m = read(); pos = 0;
        for(int i = 1; i <= n; i++) { g[i].clear(); fa[i] = vis[i] = false; siz[i] = 1; }
        for(int i = 0; i < n - 1; i++) {
            int x = read(), y = read();
            g[y].push_back(x);
            g[x].push_back(y);
            fa[x] = true;
        }
        int root;
        for(int i = 1; i <= n; i++) if(!fa[i]) { root = i; break; }
        vis[root] = true;
        dfs(root);
        for(int i = 0; i < m; i++) {
            int x = read(), y = read();
            int left = dfn[y], right = dfn[y] + siz[y] - 1;
            if(dfn[x] >= left && dfn[x] <= right) printf("Yes\n");
            else printf("No\n");
        }
    }

    return 0;
}