#include<iostream>
#include<queue>
using namespace std;

const int MAXN = 1e6 + 5;
int n, k, l[MAXN], r[MAXN];
bool vis[MAXN]; long long ans, a[MAXN];
struct node {
    long long w; int id;
    bool operator < (const node &b) const {
        return w < b.w;
    }
};
priority_queue<node> q;

int main() {
    std::ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n >> k;
    for (int i = 1; i <= n; i++) {
        cin >> a[i]; q.push({a[i], i});
        l[i] = i - 1, r[i] = i + 1;
    }
    l[n + 1] = n; r[0] = 1;
    for (int i = 1; i <= k; i++) {
        while (!q.empty() && vis[q.top().id]) q.pop();
        node u = q.top(); q.pop();
        if (u.w < 0) break;
        ans += u.w;
		u.w = a[u.id] = a[l[u.id]] + a[r[u.id]] - a[u.id];
		vis[l[u.id]] = vis[r[u.id]] = true;
		l[u.id] = l[l[u.id]], r[u.id] = r[r[u.id]];
		r[l[u.id]] = l[r[u.id]] = u.id;
		q.push(u);
    }
    cout << ans << endl;

    return 0;
}