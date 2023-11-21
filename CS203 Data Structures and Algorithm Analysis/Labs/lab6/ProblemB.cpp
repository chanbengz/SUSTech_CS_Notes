#include<cstdio>
#include<vector>
using std::vector;
int n, ans; bool visit[500005];
long long num;

struct Node {
    int data, wei;
    vector<int> child;
    vector<int> weight;
} arr[500005];

void search(Node now) {
    visit[now.data] = true;
    if(now.child.size() == 1) {
        if(now.wei == num) { ans++; return; }
    }
    for(int i = 0; i < now.child.size(); i++) {
        if(visit[now.child[i]]) continue;
        arr[now.child[i]].wei = now.wei + now.weight[i];
        search(arr[now.child[i]]);
    }
}

int main() {
    scanf("%d%lld", &n, &num);
    for(int i = 0; i < n - 1; i++) {
        int u,v,w;
        scanf("%d%d%d", &u, &v, &w);
        arr[u].data = u;
        arr[u].child.push_back(v);
        arr[u].weight.push_back(w);
        arr[v].data = v;
        arr[v].child.push_back(u);
        arr[v].weight.push_back(w);
    }
    search(arr[1]);
    printf("%d\n", ans);

    return 0;
}