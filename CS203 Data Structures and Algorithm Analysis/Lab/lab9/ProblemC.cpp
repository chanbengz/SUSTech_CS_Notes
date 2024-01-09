#include <cstdio>
#include <algorithm>
const int MAXN = 1e6 + 10;
int n, m, k, fa[MAXN];
long long ans;

struct edge{
    int u, v, w;
    bool operator < (const edge &other) const {
        return w > other.w;
    }
} edges[MAXN];

int find(int x) {
    return fa[x] == x ? x : fa[x] = find(fa[x]);
}

void kruskal() {
    std::sort(edges, edges + k);
    for (int i = 0; i <= n * m; i++) fa[i] = i;
    int cnt = 0;

    for(int i = 0; i < k; i++) {
        int u = edges[i].u, v = edges[i].v;
        int fu = find(u), fv = find(v);
        if(fu != fv) {
            fa[fu] = fv;
            ans += edges[i].w;
            cnt++;
        }
        if(cnt == n * m - 1) break;
    }
}

int main() {
    scanf("%d%d", &n, &m);
    int16_t map[n + 2][m + 2];
    for(int i = 1; i <= n; i++) {
        for(int j = 1; j <= m; j++) {
            scanf("%hd", &map[i][j]);
        }
    }

    for(int i = 1; i <= n; i++) {
        for(int j = 1; j <= m; j++) {
            if(j != m) {
                edges[k].u = m * (i - 1) + j;
                edges[k].v = m * (i - 1) + j + 1;
                edges[k++].w = map[i][j] * map[i][j + 1];
            }
            if(i != n) {
                edges[k].u = m * (i - 1) + j;
                edges[k].v = m * i + j;
                edges[k++].w = map[i + 1][j] * map[i][j];
            }
        }
    }

    kruskal();

    printf("%lld\n", ans);

    return 0;
}