#include <iostream>
#include <vector>
#define int long long
using std::cin;
using std::cout;
using std::endl;
using std::vector;

int n, m, a, b;
const int MAXN = 200005;
vector<int> g[MAXN];
bool visa[MAXN], visb[MAXN];

inline int dfsb(int x)
{
    visb[x] = 1;
    int ret = 1;
    if(x == a) { visb[x] = 0; return 0; }
    for(int &i: g[x]) {
        if(visb[i]) continue;
        int s = dfsb(i);
        if(s == 0 && x != b) { visb[x]=0; return 0; }
        ret += s;
    }
    return ret;
}

inline int dfsa(int x)
{
    visa[x] = 1;
    int ret = 1;
    if(x == b) { visa[x] = 0; return 0; }
    for(int &i: g[x]){
        if(visa[i]) continue;
        int s = dfsa(i);
        if(s == 0 && x != a ) { visa[x] = 0; return 0; }
        ret += s;
    }
    return ret;
}

signed main()
{
    std::ios::sync_with_stdio(false);
    cin >> n >> m >> a >> b;
    for (int i = 0; i < m; i++) {
        int u, v; cin >> u >> v;
        g[u].push_back(v);
        g[v].push_back(u);
    }
    int aa = dfsa(a) - 1, bb = dfsb(b) - 1;
    cout << aa * bb << endl;
    return 0;
}
