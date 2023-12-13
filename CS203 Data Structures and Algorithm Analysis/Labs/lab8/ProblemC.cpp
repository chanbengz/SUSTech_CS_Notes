#include<cstdio>
#include<vector>
#include<queue>
using namespace std;
const int MAXN = 200005;
int n, m, t;
vector<int> g[MAXN];
bool visited[MAXN];

int main() {
    scanf("%d", &t);
    while(t--) {
        scanf("%d%d", &n, &m);
        for(int i = 0; i <= n; i++) { g[i].clear(); visited[i] = false; }
        g[0].push_back(1);
        for(int i = 0; i < m; i++) {
            int u, v; scanf("%d%d", &u, &v);
            g[u].push_back(v);
            g[v].push_back(u);
        }
        queue<int> q1,q2;
        visited[0] = true; q1.push(0);
        int cnt1 = 0, cnt2 = 0, *current = &cnt1, *tmp = &cnt2;
        while(!q1.empty()) {
            while(!q1.empty()) {
                int u = q1.front();
                for(int i = 0; i < g[u].size(); i++) {
                    int v = g[u][i];
                    if(visited[v]) continue;
                    visited[v] = true;
                    *current += 1;
                    q2.push(v);
                } q1.pop();
            }
            swap(q1, q2); swap(current, tmp);
        }
        printf("%d\n", min(cnt1, cnt2));
        int flag = 1;
        visited[0] = false; q1.push(0);
        while(!q1.empty()) {
            while(!q1.empty()) {
                int u = q1.front();
                for(int i = 0; i < g[u].size(); i++) {
                    int v = g[u][i];
                    if(!visited[v]) continue;
                    if((flag & 1) && (cnt1 <= cnt2))  printf("%d ", v);
                    else if (!(flag & 1) && (cnt1 > cnt2)) printf("%d ", v);
                    visited[v] = false;
                    q2.push(v);
                } q1.pop();
            }
            flag++; swap(q1, q2);
        }
        printf("\n");
    }

    return 0;
}