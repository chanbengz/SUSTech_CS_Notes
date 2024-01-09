#include <cstdio>
#include <vector>
#include <stack>
using std::vector;
using std::stack;

const int MAXN = 50005;
int n, m, s, dfn_cnt, cscc, scc[MAXN], dfn[MAXN], low[MAXN], instk[MAXN];
vector<int> g[MAXN], g2[MAXN], fa[MAXN];
stack<int> stk;

void tarjan(int p) {
    dfn[p] = low[p] = ++dfn_cnt;
    stk.push(p); instk[p] = 1;
    for(int i = 0; i < g[p].size(); i++) {
        int v = g[p][i];
        if(!dfn[v]) {
            tarjan(v);
            low[p] = std::min(low[p], low[v]);
        } else if(instk[v]) {
            low[p] = std::min(low[p], dfn[v]);
        }
    }
    if(dfn[p] == low[p]) {
        cscc++;
        while(true) {
            int x = stk.top(); stk.pop();
            instk[x] = 0;
            scc[x] = cscc;
            if(x == p) break;
        }
    }
}

int main() {
    scanf("%d%d%d", &n, &m, &s);
    for(int i = 0; i < m; i++) {
        int u, v; scanf("%d%d", &u, &v);
        g[u].push_back(v);
    }

    for (int i = 1; i <= n; ++i)
        if (!dfn[i]) tarjan(i);
    
    for (int u = 1; u <= n; ++u) {
        for (int i = 0; i < g[u].size(); ++i) {
            int v = g[u][i];
            if (scc[u] != scc[v]) {
                g2[scc[u]].push_back(scc[v]);
                fa[scc[v]].push_back(scc[u]);
            }
        }
    }
    int ans = 0;

    for (int i = 1; i <= cscc; ++i) {
        if (fa[i].size() == 0) {
            ans++;
        }
    }

    printf("%d\n", ans - (fa[scc[s]].size() == 0));

    return 0;
}