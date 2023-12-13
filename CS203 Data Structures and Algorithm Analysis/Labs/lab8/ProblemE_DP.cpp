#include<cstdio>
const int MAXN = 10;
int t, n, m, mat[MAXN][MAXN];
long long dp[MAXN][MAXN][1 << (MAXN + 1)];
bool select[10][10];

int max(int a, int b) { return a > b ? a : b; }

bool check(int i, int j) {
    for(int k = 0; k < m; k++) {
        if((j >> k) & 1) {
            if((i >> (k + 1)) & 1) return false;
            if((i >> k) & 1) return false;
            if((i >> (k - 1)) & 1) return false;
        }
    }
    return true;
}

void dfs(int x, int y, int cur_sum, bool flag) {
    if(y > m) y = 1, x++;
    if(x > (1 + flag) * n / 2) {
        int state = 0;
        for(int i = 1; i <= m; i++) state = (state << 1) | select[n / 2 + flag][i];
        s[flag][state] = max(s[flag][state], cur_sum); 
        return;
    }
    select[x][y] = false;
    dfs(x, y + 1, cur_sum, flag);
}

int main() {
    scanf("%d", &t);
    while (t--) {
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                for(int k = 0; k < (1 << (MAXN + 1)); k++) {
                    dp[i][j][k] = 0;
                }
            }
        }
        scanf("%d%d", &n, &m);
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                scanf("%d", &mat[i][j]);
            }
        }
        long long ans = 0;
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                for(int k = 0; k < (1 << (MAXN + 1)); k++) {
                    
                }
            }
        }
        printf("%lld\n", dp[n][m][(1 << m) - 1]);
    }

    return 0;
}
