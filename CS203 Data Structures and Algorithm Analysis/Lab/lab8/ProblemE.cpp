#include<cstdio>
int t, n, m, mat[10][10], visited[10][10], s[2][64];
bool select[10][10];

int max(int a, int b) { return a > b ? a : b; }
int dire[9][2] = {
    {0,0},
    {1,0} , {1,1} , {1,-1}, {0,1},
    {0,-1}, {-1,0}, {-1,1}, {-1,-1}
};

bool check(int i, int j) {
    for(int k = 0; k < m; k++) {
        if((j >> k) & 1) {
            if((i >> (k + 1)) & 1) return false;
            if((i >> k) & 1) return false;
            if(k && ((i >> (k - 1)) & 1)) return false;
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
    if(!visited[x][y]) {
        for(int k = 0; k < 9; k++) {
            int nx = x + dire[k][0], ny = y + dire[k][1];
            if(nx < 1 || nx > n || ny < 1 || ny > m) continue;
            visited[nx][ny]++;
        }
        select[x][y] = true;
        dfs(x, y + 1, cur_sum + mat[x][y], flag);
        for(int k = 0; k < 9; k++) {
            int nx = x + dire[k][0], ny = y + dire[k][1];
            if(nx < 1 || nx > n || ny < 1 || ny > m) continue;
            visited[nx][ny]--;
        }
    }
    select[x][y] = false;
    dfs(x, y + 1, cur_sum, flag);
}

int main() {
    scanf("%d", &t);
    while (t--) {
        for(int i = 0; i < 64; i++) s[0][i] = s[1][i] = -1;
        scanf("%d%d", &n, &m);
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                scanf("%d", &mat[i][j]);
                visited[i][j] = 0;
            }
        }
        if(n == 1) {
            long long ans = 0;
            dfs(1, 1, 0, 1);
            for(int i = 0; i < 64; i++) {
                if(s[1][i] == 0) continue;
                ans = max(ans, s[1][i]);
            }
            printf("%lld\n", ans);
            continue;
        }
        dfs(n / 2 + 1, 1, 0, 1);
        dfs(1, 1, 0, 0);
        long long ans = 0;
        for(int i = 0; i < 64; i++) {
            if(s[0][i] == -1) continue;
            for(int j = 0; j < 64; j++) {
                if(s[1][j] == -1 || !check(i, j)) continue;
                ans = max(ans, s[0][i] + s[1][j]);
            }
        }
        printf("%lld\n", ans);
    }

    return 0;
}
