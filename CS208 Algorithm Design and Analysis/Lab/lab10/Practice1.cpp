#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

const int MAXN = 1e5 + 5;
int n;
struct point {
    long long x, y;
    bool operator < (const point &a) const { return x < a.x; }
} p[MAXN], q[MAXN];
long long dis(const point a, const point b) { return (a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y); }

long long find(int l, int r) {
    if(l == r) return 1ull << 62;
    int mid = (l + r) / 2;
    long long midx = p[mid].x;
    long long d = min(find(l, mid), find(mid + 1, r));
    int i = l, j = mid + 1, k = 0;
    while(i <= mid || j <= r) {
        if(i <= mid && (j > r || p[i].y < p[j].y)) q[++k] = p[i++];
        else q[++k] = p[j++];
    }
    for(int i = 1; i <= k; i++) p[l + i - 1] = q[i];
    k = 0;
    long long sd = sqrt(d);
    for(int i = l; i <= r; i++) {
        if(abs(p[i].x - midx) < sd) q[++k] = p[i];
    }
    for(int i = 1; i <= k; i++) {
        for(int j = i - 1; j >= 1 && q[i].y - q[j].y <= sd; j--) {
            d = min(d, dis(q[i], q[j]));
            sd = sqrt(d);
        }
    }
    return d;
}

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n;
    for(int i = 1; i <= n; i++) {
        cin >> p[i].x >> p[i].y;
    }
    sort(p + 1, p + n + 1);
    cout << find(1, n) << endl;

    return 0;
}