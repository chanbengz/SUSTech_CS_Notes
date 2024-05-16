#include <iostream>
using namespace std;

const int MAXN = 5e2 + 5, MAXM = 1e5 + 5;
int n, m, d, price[MAXN][MAXN], dp[MAXM];

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n >> m >> d;
    for(int i = 1; i <= n; i++)
        for(int j = 1; j <= m; j++) cin >> price[i][j];
    
    for(int i = 2; i <= m; i++) {
        int maxp = -1;
        for(int i = 0; i < MAXM; i++) dp[i] = 0;
        for(int j = 1; j <= n; j++) {
            for(int k = price[j][i - 1]; k <= d; k++) {
                dp[k] = max(dp[k], dp[k - price[j][i - 1]] + price[j][i] - price[j][i - 1]);
                maxp = max(maxp, dp[k]);
            }
        }
        d += maxp;
    }
    cout << d << endl;

    return 0;
}