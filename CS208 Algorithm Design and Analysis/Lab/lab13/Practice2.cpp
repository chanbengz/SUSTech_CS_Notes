#include <iostream>
#include <string>
using namespace std;

const int MAXN = 100;
int dp[MAXN][MAXN];
string s1, s2;

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    getline(cin, s1);
    getline(cin, s2);
    int n = s1.size(), m = s2.size();

    for(int i = 1; i <= n; i++) {
        char c1 = s1[i - 1];
        for(int j = 1; j <= m; j++) {
            char c2 = s2[j - 1];
            dp[i][j] = c1 == c2 ? dp[i - 1][j - 1] + 1 : max(dp[i - 1][j], dp[i][j - 1]);
        }
    }

    cout << n + m - 2 * dp[n][m] << endl;

    return 0;
}