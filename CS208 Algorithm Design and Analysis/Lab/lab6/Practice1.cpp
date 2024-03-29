#include <iostream>
#include <algorithm>
using namespace std;

const int MAXN = 1e5 + 5;
struct interval {
    int l, r;
} intervals[MAXN];
int n;

bool cmp(interval &a, interval &b) {
    if (a.r != b.r) return a.r < b.r;
    return a.l < b.l;
}

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n;
    for (int i = 1; i <= n; ++i) cin >> intervals[i].l >> intervals[i].r;
    sort(intervals, intervals + n, cmp);
    int ans = 1, start = intervals[1].r;
    for (int i = 2; i <= n; ++i) {
        if (intervals[i].l > start) {
            ans++;
            start = intervals[i].r;
        }
    }
    cout << ans << endl;

    return 0;
}