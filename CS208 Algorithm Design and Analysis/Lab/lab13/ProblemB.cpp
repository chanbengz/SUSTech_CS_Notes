#include <iostream>
using namespace std;

const int MAXN = 205;
const int INF = 1e9 + 7;
int head[MAXN], lev[MAXN], cur[MAXN];
long long sum, ans, s, t, cnt = -1;

struct node {
    int to, next, w;
} edge[MAXN * 2 + 1000000];

inline void add(int u, int v, int w){ 
    edge[++cnt].to = v;
    edge[cnt].w = w;
    edge[cnt].next = head[u];
    head[u] = cnt;
}

bool bfs(int m) {
    int que[m], r = 0, u, v;
    for(int i = 1; i <= m; i++) lev[i] = -1, cur[i] = head[i];
    que[0] = s, lev[s] = 0;
    for(int i = 0; i <= r; i++) {
        u = que[i];
        for(int e = head[u]; e != -1; e = edge[e].next) {
            v = edge[e].to;
            if(edge[e].w > 0 && lev[v] == -1) {
                lev[v] = lev[u] + 1;
                que[++r] = v;
                if(v == t) return true;
            }
        }
    }
    return false;
}

long long dinic(int u, long long flow, int m) {
    if(u == m) return flow;
    long long res = 0, delta;
    for(int &e = cur[u], v; e != -1; e = edge[e].next) {
        v = edge[e].to;
        if(edge[e].w > 0 && lev[v] > lev[u]) {
            delta = dinic(v, min(flow - res, (long long) edge[e].w), m);
            if(delta > 0) {
                edge[e].w -= delta;
                edge[e ^ 1].w += delta;
                res += delta;
                if(res == flow) return res;
            }
        }
    }
    if(res != flow) lev[u] = -1;
    return res;
}

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    for(int i = 0; i < MAXN; i++) head[i] = -1;
    int n, m;
    cin >> n >> m; s = n + 1, t = n + 2;
    for(int i = 1, b; i <= n; i++) {
        cin >> b;
        if(b > 0) { add(s, i, 1), add(i, s, 0); sum += b; }
        else { add(i, t, 1), add(t, i, 0); }
    }
    for(int i = 1, u, v; i <= m; i++) { cin >> u >> v; add(v, u, INF), add(u, v, 0); }
    while(bfs(t)) ans += dinic(s, INF, t);
    cout << sum - ans << endl;

    return 0;
}