#include <iostream>
#include <vector>
using namespace std;

const int MAXN = 1e6 + 5;
long long n, L, R, sum[MAXN];

long long merge(int l, int r) {
    if(l >= r) return 0;
    int mid = (l + r) / 2;
    long long low = merge(l, mid), high = merge(mid + 1, r);
    long long ans = low + high;

    int i = l, j = mid + 1, k = mid + 1;
    while(i <= mid) {
        while(j <= r && sum[j] - sum[i] < L) j++;
        while(k <= r && sum[k] - sum[i] <= R) k++;
        ans += k - j;
        i++;
    }

    long long merged[MAXN], idx = 0;
    i = l, j = mid + 1;
    while(i <= mid || j <= r) {
        if(i > mid) merged[idx++] = sum[j++];
        else if(j > r) merged[idx++] = sum[i++];
        else if(sum[i] < sum[j]) merged[idx++] = sum[i++];
        else merged[idx++] = sum[j++];
    }

    for(int i = 0; i < idx; i++) sum[l + i] = merged[i];
    return ans;
}

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n >> L >> R;

    for (int i = 1, x; i <= n; i++) {
        cin >> x;
        sum[i] = x + sum[i - 1];
    }

    cout << merge(0, n) << endl;

    return 0;
}