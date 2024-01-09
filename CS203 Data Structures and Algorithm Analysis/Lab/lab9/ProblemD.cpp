#include <cstdio>
#include <vector>
#include <algorithm>
using std::vector;

const int MAXN = 100005;
int n, m, k, c, cost[MAXN][105];
vector<int> g[MAXN];
bool vis[MAXN];

inline int read(){
    register int x = 0, t = 1;
    register int ch = getchar();
    while(ch < '0' || ch > '9'){
        if(ch == '-') t = -1;
        ch = getchar();
    }
    while(ch >= '0' && ch <= '9'){
        x = (x << 1) + (x << 3) + (ch ^ 48);
        ch = getchar();
    }
    return x * t;
}

class Queue {
    public:
        int front, rear, arr[MAXN];
        Queue() { this -> front = this -> rear = 0; }
        void push(int num) { arr[rear++] = num; }
        int pop() { return arr[front++]; }
        bool empty() { return front == rear; }
};

int main() {
    n = read(), m = read(), k = read(), c = read();
    Queue q[k + 1];
    for(int i = 1; i <= n; i++) {
        int x = read();
        q[x].push(i);
    }

    for(int i = 0; i < m; i++) {
        int u = read(), v = read();
        g[u].push_back(v);
        g[v].push_back(u);
    }

    for(int i = 1; i <= k; i++) {
        for(int j = 1; j <= n; j++) vis[j] = false;
        for(int j = 0; j < q[i].rear; j++) vis[q[i].arr[j]] = true;

        while(!q[i].empty()) {
            int u = q[i].pop();
            for(int j = 0; j < g[u].size(); j++) {
                int v = g[u][j];
                if(vis[v]) continue;
                cost[v][i] = cost[u][i] + 1;
                vis[v] = true;
                q[i].push(v);
            }
        }
    }

    for(int i = 1; i <= n; i++) {
        long long ans = 0; int cnt = 0;
        std::sort(cost[i] + 1, cost[i] + k + 1);
        for(int j = 1; j <= k; j++) {
            if(cost[i][j] > 0) {
                ans += cost[i][j];
                cnt++;
            }
            if(cnt == c - 1) break;
        }
        printf("%lld ", ans);
    }
    printf("\n");

    return 0;
}