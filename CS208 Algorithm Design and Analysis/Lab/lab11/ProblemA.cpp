#include <iostream>
using namespace std;

const int MAXN = 3e3 + 5;
const long long MOD = 1e9 + 7;
int t, n, m;
long long dp[MAXN][MAXN];

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> t;
    while(t--) {
        cin >> n >> m;
        dp[0][0] = 1;
        for(int i = 1; i <= m; i++) {
            for(int j = 0; j < n; j++) {
                dp[i][j] = (dp[i - 1][(j + 1) % n] + dp[i - 1][(j + n - 1) % n]) % MOD;
            }
        }
        cout << dp[m][0] << endl;
    }

    return 0;
}