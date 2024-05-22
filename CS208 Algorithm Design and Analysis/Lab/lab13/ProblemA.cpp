#include <iostream>
using namespace std;

const int MAXN = 2e3 + 5;
int matrix[MAXN][MAXN], dp[MAXN][MAXN], n, m, ans;

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n >> m;
    for(int i = 1; i <= n; i++) for(int j = 1; j <= m; j++) cin >> matrix[i][j];
    for(int i = 1; i <= n; i++) {
        for(int j = 1; j <= m; j++) {
            if(matrix[i][j] == 1) {
                dp[i][j] = min(min(dp[i - 1][j], dp[i][j - 1]), dp[i - 1][j - 1]) + 1;
                ans = max(ans, dp[i][j]);
            }
        }
    }
    cout << ans << endl;

    return 0;
}