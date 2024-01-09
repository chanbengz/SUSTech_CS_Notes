#include <cstdio>
#include <vector>
using namespace std;

const int MAX = 1005;
int pre[MAX], in[MAX], post[MAX];
int n, t;
vector<int> g[MAX];

void print(int x) {
    for (int i = 0; i < g[x].size(); i++) {
        print(g[x][i]);
    }
    printf("%d ", x);
}

int build(int p, int l, int r, int fa) {
    if (l > r) return p;
    int i;
    for (i = l; i <= r; ++i) {
        if (in[i] == pre[p]) break;
    }
    g[fa].push_back(pre[p]);
    int left = build(p + 1, l, i - 1, pre[p]);
    int right = build(left, i + 1, r, pre[p]);
    return right;
}

int main() {
    scanf("%d", &t);
    while (t--) {
        scanf("%d", &n);
        for (int i = 1; i <= n; i++) scanf("%d", &pre[i]);
        for (int i = 1; i <= n; i++) scanf("%d", &in[i]);
        for (int i = 0; i <= n; i++) g[i].clear();
        build(1, 1, n, 0);
        print(pre[1]);
        printf("\n");
    }
    return 0;
}