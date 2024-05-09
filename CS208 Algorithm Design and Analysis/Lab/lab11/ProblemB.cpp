#include <iostream>
using namespace std;

const int MAXN = 1e3 + 5;
int n, k;
long long a[MAXN], b[MAXN], dp[MAXN][MAXN];

long long query(int l, int r) { return b[r] ^ b[l - 1]; }

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n >> k; b[0] = 0;
    for(int i = 1; i <= n; i++) { cin >> a[i]; b[i] = b[i - 1] ^ a[i]; }

    dp[1][1] = a[1];
    for(int i = 1; i <= n; i++) dp[i][1] = query(1, i);
    for(int i = 1; i <= n; i++) {
        for(int j = 2; j <= k; j++) {
            for(int l = 1; l <= i;l++) {
                dp[i][j] = max(dp[i][j], dp[l - 1][j - 1] + query(l, i));
            }
        }
    }

    cout << dp[n][k] << endl;

    return 0;
}
