#include <iostream>
#include <vector>
using namespace std;

const int MAXN = 1e3 + 5;
struct task {
    int a, t, d, w;
} tasks[MAXN];
int n, penalty, dp[MAXN][MAXN];

bool cmp(task &a, task &b) { return a.d < b.d; }

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n;
    for(int i = 1; i <= n; i++) { cin >> tasks[i].t; tasks[i].a = i; }
    for(int i = 1; i <= n; i++) cin >> tasks[i].d;
    for(int i = 1; i <= n; i++) cin >> tasks[i].w;
    for(int i = 1; i <= n; i++) for(int j = 0; j <= tasks[n].d; j++) dp[i][j] = MAXN;

    sort(tasks + 1, tasks + n + 1, cmp);
    for(int i = 0; i <= tasks[n].d; i++) dp[1][i] = i >= tasks[1].t ? 0 : tasks[1].w;
    for(int i = 2; i <= n; i++) {
        for(int j = 0; j <= tasks[n].d; j++) {
            dp[i][j] = tasks[i].d <= min(tasks[i].d, j) ? 
                min(dp[i - 1][j] + tasks[i].w, dp[i - 1][min(tasks[i].d, j) - tasks[i].t]) 
                : dp[i - 1][j] + tasks[i].w;
        }
    }

    cout << dp[n][tasks[n].d] << endl;

    return 0;
}