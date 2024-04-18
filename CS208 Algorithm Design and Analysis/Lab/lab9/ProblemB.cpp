#include <iostream>
#include <algorithm>
using namespace std;

const int MAXN = 1e6 + 5;
long long n, ans = 0, x[MAXN], t[MAXN];
struct node {
    long long v, idx;
    bool operator < (const node &a) const {
        return v < a.v;
    }
}a[MAXN], b[MAXN];

void merge(int l, int r){
    if(l == r) return;
    int mid = (l + r) / 2;
    merge(l , mid);
    merge(mid + 1, r);
    int i = l, j = mid + 1, k = 0;
    while(i <= mid && j <= r) {
        if (x[i] <= x[j]) t[k++] = x[i++];
        else {
            t[k++] = x[j++];
            ans += mid - i + 1;
        }
    }
    while(i <= mid) t[k++] = x[i++];
    while(j <= r) t[k++] = x[j++];
    for(int i = 0; i < r - l + 1; i++) x[l + i] = t[i];
}

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n;
    for(int i = 0; i < n; i++) cin >> a[i].v, a[i].idx = i;
    for(int i = 0; i < n; i++) cin >> b[i].v, b[i].idx = i;
    sort(a, a + n);
    sort(b, b + n);
    for(int i = 0; i < n; i++) x[b[i].idx] = a[i].idx;
    merge(0, n - 1);
    cout << ans << endl;

    return 0;
}