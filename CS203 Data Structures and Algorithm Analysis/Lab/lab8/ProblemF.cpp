#include<cstdio>
#include<vector>
using namespace std;
const int MOD = 1e9 + 7, MAXN = 1e5 + 5;
int n, m, t, a[MAXN], b[MAXN], f[MAXN];

int main() {
    scanf("%d", &t);
    while(t--) {
        scanf("%d%d", &n, &m);
        for(int i = 1; i <= n; i++) scanf("%d%d", &a[i], &b[i]);
        vector<int> g[n + 1];
        for(int i = 0, u, v; i < m; i++) {
            scanf("%d%d", &u, &v);
            g[v].push_back(u);
        }
        long long sum = 0;
        for(int i = 1; i <= n; i++) {
            int cur = 0;
            for(int j = 0; j < g[i].size(); j++) {
                cur = (cur + f[g[i][j]]) % MOD;
                cur = (cur + a[g[i][j]]) % MOD;
            }
            f[i] = cur;
        }
        for(int i = 1; i <= n; i++) sum = (sum + ((long long) f[i] * b[i])) % MOD;
        printf("%lld\n", sum % MOD);
    }

    return 0;
}