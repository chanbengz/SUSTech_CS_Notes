#include<cstdio>
int n, m, t;
int g[505][505];

int main() {
    scanf("%d", &t);
    while(t--) {
        scanf("%d%d", &n, &m);
        for(int i = 1; i <= n; i++) {
            for(int j = 1; j <= n; j++) g[i][j] = 0;
        }
        for(int i = 0; i < m; i++) {
            int u, v;
            scanf("%d%d", &u, &v);
            g[u][v] += 1;
        }
        for(int i = 1; i <= n; i++) {
            for(int j = 1; j <= n; j++) printf("%d ", g[i][j]);
            printf("\n");
        }
    }

    return 0;
}