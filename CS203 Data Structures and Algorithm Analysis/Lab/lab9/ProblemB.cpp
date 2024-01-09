#include <cstdio>
#include <algorithm>
const int MAXN = 200005;
int n, m, fa[MAXN];
long long ans;

struct edge{
    int u, v, w;
    bool operator < (const edge &other) const {
        return w < other.w;
    }
} edges[MAXN];

int find(int x) {
    return fa[x] == x ? x : fa[x] = find(fa[x]);
}

void kruskal() {
    std::sort(edges, edges + m);
    for (int i = 0; i < n; i++) fa[i] = i;

    for(int i = 0; i < m; i++) {
        int u = edges[i].u, v = edges[i].v;
        int fu = find(u), fv = find(v);
        if(fu != fv) {
            fa[fu] = fv;
            if(edges[i].w > 0) ans += edges[i].w;
        }
    }
}

int main() {
    scanf("%d%d", &n, &m);
    long long sum = 0;
    for(int i = 0; i < m; i++) {
        scanf("%d%d%d", &edges[i].u, &edges[i].v, &edges[i].w);
        if(edges[i].w > 0) sum += edges[i].w;
    }

    kruskal();
    printf("%lld\n", sum - ans);

    return 0;
}