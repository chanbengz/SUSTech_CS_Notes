#include <iostream>
#include <algorithm>
using namespace std;

const int MAXN = 5e3 + 5;
int n, a[MAXN], x[MAXN], b[MAXN], dp1[MAXN][MAXN], dp2[MAXN][MAXN];

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n; for(int i = 1; i <= n; i++) { cin >> a[i]; a[i] -= i; x[i] = a[i]; }
    sort(x + 1, x + n + 1);
    int l = unique(x + 1, x + n + 1) - x - 1;
    for(int i = 1; i <= n; i++) b[i] = lower_bound(x + 1, x + l + 1, a[i]) - x;
    for(int i = 1; i <= n; i++) for(int j = 1; j <= n; j++) dp1[i][j] = dp2[i][j] = (int) 1e9;

    for(int i = 1; i <= n; i++) {
        int min1 = 1e9, min2 = 1e9;
        for(int j = 1; j <= l; j++) {            
            if (dp1[i - 1][j] < min1) {
                min1 = dp1[i - 1][j];
                min2 = dp2[i - 1][j];
            }
            if (dp1[i - 1][j] == min1) {
                min2 = min(min2, dp2[i - 1][j]);
            }
            
            if (dp1[i][j] > min1 + j != b[i]) {
                dp1[i][j] = min1 + j != b[i];
                dp2[i][j] = min2 + abs(x[j] - a[i]);
            }
            if (dp1[i][j] == min1 + j != b[i]) {
                dp2[i][j] = min(dp2[i][j], min2 + abs(x[j] - a[i]));
            }
        }
    }
    
    int ans1 = (int) 1e9, ans2 = (int) 1e9;
    for(int i = 1; i <= l; i++) {
        if (ans1 > dp1[n][i]) {
            ans1 = dp1[n][i];
            ans2 = dp2[n][i];
        }
        if (ans1 == dp1[n][i]) {
            ans2 = min(ans2, dp2[n][i]);
        }
    }
    cout << ans1 << "\n" << ans2 << endl;

    return 0;
}