#include <cstdio>
#include <queue>
#include <vector>
using std::vector;
using std::priority_queue;
const int MAXN = 5e5 + 5;

struct edge{
    int v, w;
};

int n, m, p, k;
bool vis[MAXN][12];
long long dist[MAXN][12];
vector<edge> g[MAXN];
vector<int> portal[MAXN];

struct node{
    int u, level;
    bool operator < (const node& rhs) const {
        return dist[u][level] > dist[rhs.u][rhs.level];
    }
};

int main() {
    scanf("%d%d%d%d", &n, &m, &p, &k);
    for(int i = 1; i <= n; i++) {
        for(int j = 0; j <= k; j++) {
            dist[i][j] = 1e18;
        }
    }
    for(int i = 0; i < m; i++) {
        int u, v, c;
        scanf("%d%d%d", &u, &v, &c);
        g[u].push_back((edge){v,c});
    }
    for(int i = 0; i < p; i++) {
        int u, v;
        scanf("%d%d", &u, &v);
        portal[u].push_back(v);
    }
    int s, t; scanf("%d%d", &s, &t);
    priority_queue<node> q;
    q.push((node){s, 0});
    dist[s][0] = 0;
    while(!q.empty()) {
        node cur = q.top(); q.pop();
        if(vis[cur.u][cur.level]) continue;
        vis[cur.u][cur.level] = true;
        for(edge &e : g[cur.u]) {
            if(dist[e.v][cur.level] > dist[cur.u][cur.level] + e.w) {
                dist[e.v][cur.level] = dist[cur.u][cur.level] + e.w;
                if(!vis[e.v][cur.level]) q.push((node){e.v, cur.level});
            }
        }

        for(int &v : portal[cur.u]) {
            if(dist[v][cur.level + 1] > dist[cur.u][cur.level] && cur.level < k) {
                dist[v][cur.level + 1] = dist[cur.u][cur.level];
                if(!vis[v][cur.level + 1]) q.push((node){v, cur.level + 1});
            }
        }
    }

    long long ans = 1e18;
    for(int i = 0; i <= k; i++) {
        ans = std::min(ans, dist[t][i]);
    }

    printf("%lld\n", ans);

    return 0;
}