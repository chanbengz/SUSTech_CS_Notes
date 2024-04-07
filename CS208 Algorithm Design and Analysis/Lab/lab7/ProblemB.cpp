#include <iostream>
#include <algorithm>
using namespace std;

const int MAXN = 2e5 + 5;
long long n, m, k, t, ans, upper;
long long l[MAXN], r[MAXN];
long long a[2 * MAXN], numa[2 * MAXN], numb[2 * MAXN], x[2 * MAXN], y[2 * MAXN];

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
    cin >> n >> m >> k;
	for(int i = 0; i < n; i++) {
        cin >> l[i] >> r[i];
        a[2 * i] = l[i];
        a[2 * i + 1] = r[i];
	}
	sort(a, a + 2 * n);
	t = unique(a, a + 2 * n) - a;
	for(int i = 0; i < n; i++) {
        int L = lower_bound(a, a + t, l[i]) - a;
        int R = lower_bound(a, a + t, r[i]) - a;
        if (L < R) x[L]++, x[R]--;
        else y[R]++, y[L]--;
    }
    numa[0] = x[0], numb[0] = y[0];
    for(int i = 1; i < t; i++) numa[i] = numa[i - 1] + x[i], numb[i] = numb[i - 1] + y[i];

    for(int i = t - 1; i >= 0; i--) {
        long long px = max((numa[i] + m - 1) / m, (numb[i] + m - 1) / m);
        if(upper < px) {
            ans += (a[i + 1] - 1) * (px - upper) * 2;
            upper = px;
        }
    }

    cout << ans << endl;

    return 0;
}