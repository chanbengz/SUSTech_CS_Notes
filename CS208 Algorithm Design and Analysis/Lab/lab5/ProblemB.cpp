#include <iostream>
using namespace std;
const int MAX_N = 1e5 + 5;
int n, s, k, cnt, dis[MAX_N], fa[MAX_N], head[MAX_N];
bool flag[MAX_N];
int ans = 2147483647;
struct edge {
    int to, next, w;
} e[MAX_N << 1];

void add(int u, int v, int w) {
    e[++cnt].to = v;
    e[cnt].w = w;
    e[cnt].next = head[u];
    head[u] = cnt;
}

void dfs(int father, int x){
	fa[x] = father;
	if(dis[x] > dis[k]) k = x;
	for(int i = head[x]; i ; i = e[i].next){
		int y = e[i].to;
		if(y == father || flag[y]) continue;
		dis[y] = dis[x] + e[i].w;
		dfs(x, y);
	}
}

int main() {
    std::ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n >> s;
    for (int i = 1; i < n; i++) {
        int u, v, w;
        cin >> u >> v >> w;
        add(u, v, w);
        add(v, u, w);
    }
    dis[1] = 1; dfs(0, 1);
	dis[k] = 0; dfs(0, k);
	int top = k, j = top, l = 1, r = 0;
	for(int i = top; i; i = fa[i]) {
		while(dis[j] - dis[i] > s) j = fa[j];
        ans = min(ans, max(dis[top] - dis[j], dis[i]));
	}

	for(int i = top; i; i = fa[i]) flag[i] = true;

	for(int i = top; i; i = fa[i]) {
		k = i;
		dis[k] = 0;
		dfs(fa[i], i);
	}

	for(int i = 1; i <= n; i++) ans = max(ans, dis[i]);
	cout << ans << endl;

    return 0;
}