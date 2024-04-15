#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;

const int MAXN = 5e4 + 5;
const int MAXM = 5e7 + 5;
int T, n, k, fa[MAXN], perm[MAXN];
long long arr[MAXN], ans;

struct edge{
    int u, v; long long w;
    bool operator < (const edge &other) const {
        return w < other.w;
    }
} edges[MAXM];

int find(int x) {
    return fa[x] == x ? x : fa[x] = find(fa[x]);
}

inline void kruskal() {
    sort(edges, edges + k);
    for (int i = 0; i <= n; i++) fa[i] = i;
    int cnt = 0;
    for(int i = 0; i < k; i++) {
        int u = edges[i].u, v = edges[i].v;
        int fu = find(u), fv = find(v);
        if(fu != fv) {
            fa[fu] = fv;
            ans += edges[i].w;
            cnt++;
        }
        if(cnt >= n - 1) break;
    }
}

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> T;
    while(T--) {
        cin >> n;
        k = ans = 0;
        for(int i = 1; i <= n; i++) {
            cin >> arr[i];
            perm[arr[i]] = i;
            fa[i] = i;
        }
        int len = sqrt(n);
        for(int i = 1; i <= n; i++) {
            int upper = min(i + len, n);
            for(int j = i + 1; j <= upper; j++) {
                long long x = abs(i - j) * abs(arr[i] - arr[j]);
                if (x < n) edges[k++] = {i, j, x};
                x = abs(perm[i] - perm[j]) * abs(arr[perm[i]] - arr[perm[j]]);
                if (x < n) edges[k++] = {perm[i], perm[j], x};
            }
        }
        kruskal();
        cout << ans << endl;
    }
    return 0;
}