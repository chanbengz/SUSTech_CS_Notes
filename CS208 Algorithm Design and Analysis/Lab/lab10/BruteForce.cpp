#include <iostream>
using namespace std;

const int MAXN = 1e5 + 5;
int n;
long long ans;
struct point {
    long long x, y;
} a[MAXN];
long long dis(const point a, const point b) { return (a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y); }

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n;
    for(int i = 1; i <= n; i++) {
        cin >> a[i].x >> a[i].y;
    }
    ans = 1ull << 62;
    for(int i = 1; i < n; i++) {
        for(int j = i + 1; j <= n; j++) {
            ans = min(ans, dis(a[i], a[j]));
        }
    }
    cout << ans << endl;

    return 0;
}