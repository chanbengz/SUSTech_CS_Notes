#include <iostream>
using namespace std;

const int MAXN = 1e6 + 5;
int a[MAXN];
long long cnt;

void sort(int l ,int r){
    if (l == r) return;

    int mid = (l + r) / 2;
    sort(l , mid);
    sort(mid + 1, r);

    int i = l , j = mid + 1, k = 0;
    int t[r - l + 1];

    while (i <= mid && j <= r){
        if (a[i] <= a[j]) t[k++] = a[i++];
        else {
            t[k++] = a[j++];
            cnt += mid - i + 1;
        }
    }
    while (i <= mid) t[k++] = a[i++];
    while (j <= r) t[k++] = a[j++];
    for(int x = 0; x < r - l + 1; x++) a[l + x] = t[x];
}


int main() {
    int n = 10; cin >> n;
    for(int i = 0; i < n; ++i) cin >> a[i];
    sort(0, n - 1);
    printf("%lld\n", cnt);
    
    return 0;
}