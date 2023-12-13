#include<cstdio>
#include<vector>
using namespace std;

const int MOD = 1e9 + 7, MAXN = 1e5 + 5;
int n, m, t, a[MAXN], b[MAXN], f[MAXN];
vector<int> g[MAXN];

int main() {
    scanf("%d", &t);
    while(t--) {
        scanf("%d%d", &n, &m);
        for(int i = 0; i < MAXN; i++) { g[i].clear(); f[i] = 0; }
        for(int i = 1; i <= n; i++) scanf("%d%d", &a[i], &b[i]);
        for(int i = 0, u, v; i < m; i++) {
            scanf("%d%d", &u, &v);
            g[v].push_back(u);
        }
        long long sum = 0;
        for(int i = 1; i <= n; i++) {
            vector<int> ffa, wfa;
            for(int j = 0; j < g[i].size(); j++) {
                ffa.push_back(f[g[i][j]]);
                wfa.push_back(a[g[i][j]]);
            }
            int cur = 0;
            for(int j = 0; j < g[i].size(); j++) {
                cur = (cur + wfa[j]) % MOD;
                cur = (cur + ffa[j]) % MOD;
            }
            f[i] = cur;
        }
        for(int i = 1; i <= n; i++) sum = (sum + ((long long) f[i] * b[i])) % MOD;
        printf("%lld\n", sum % MOD);
    }

    return 0;
}