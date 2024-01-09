#include <cstdio>
#include <vector>
#include <queue>
using std::queue;
const int MAXN = 100005;
const long long MAX_LEN = 1e18 + 7;

int n, m, head[MAXN], edge_cnt;
bool visited[MAXN];
long long dist[MAXN];

struct edge{
    int to, weight, next;
} edges[MAXN];

void add(int u, int v, int w){
    edges[++edge_cnt].next = head[u];
    edges[edge_cnt].to = v;
    edges[edge_cnt].weight = w;
    head[u] = edge_cnt;
}

int main() {
    scanf("%d%d", &n, &m);
    for(int i = 1; i <= n; i++) { dist[i] = MAX_LEN; visited[i] = false; }
    for(int i = 0; i < m; ++i) {
        int u, v, w; scanf("%d%d%d", &u, &v, &w);
        add(u, v, w);
    }
    
    queue<int> q;
    q.push(1); visited[1] = true; dist[1] = 0;
    while (!q.empty()){
        int p = q.front(); q.pop();
        visited[p] = false;
        for (int i = head[p]; i != 0; i = edges[i].next){
            int v = edges[i].to, w = edges[i].weight;
            if (dist[v] > dist[p] + w){
                dist[v] = dist[p] + w;
                if (!visited[v]) {
                    q.push(v); visited[v] = true;
                }
            }
        }
    }

    printf("%lld", dist[n] == MAX_LEN ? -1 : dist[n]);

    return 0;
}