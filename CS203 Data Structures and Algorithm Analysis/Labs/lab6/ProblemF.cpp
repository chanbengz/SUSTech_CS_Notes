#include<cstdio>
#include<vector>
using std::vector;
const int MAX = 200005;
int n, maxid;
long long ans;

struct Node {
    int p, maxchild;
    vector<int> child;
} arr[MAX];

void search_max(int now, int last) {
    if(arr[now].child.size() == 1 && now != maxid) arr[now].maxchild = now;
    for(int i = 0; i < arr[now].child.size(); i++) {
        if(arr[now].child[i] == last) continue;
        search_max(arr[now].child[i], now);
        if(arr[arr[now].child[i]].p > arr[now].p) 
            arr[now].p = arr[arr[now].child[i]].p;
        if(arr[arr[now].child[i]].p > arr[arr[now].maxchild].p)
            arr[now].maxchild = arr[now].child[i];
    }
}

void search_ans(int now, int last) {
    if(arr[now].child.size() == 1 && now != last) {
        ans += arr[now].p;
        return;
    }
    arr[arr[now].maxchild].p = arr[now].p;
    for(int i = 0; i < arr[now].child.size(); i++) {
        if(arr[now].child[i] == last) continue;
        search_ans(arr[now].child[i], now);
    }
}

int main() {
    scanf("%d", &n);
    for(int i = 0; i < n - 1; i++) {
        int u,v; scanf("%d%d", &u, &v);
        arr[u].child.push_back(v);
        arr[v].child.push_back(u);
    }
    for(int i = 1; i <= n; i++)  {
        scanf("%d", &arr[i].p);
        if(arr[i].p > arr[maxid].p) {
            maxid = i;
        }
    }
    search_max(maxid, 0);
    int maxid2 = 0;
    for(int i = 0; i < arr[maxid].child.size(); i++)
        if(arr[maxid].child[i] != arr[maxid].maxchild && arr[arr[maxid].child[i]].p > arr[maxid2].p)
            maxid2 = arr[maxid].child[i];
    if(arr[maxid2].p) arr[maxid2].p = arr[maxid].p;
    else ans += arr[maxid].p;
    search_ans(maxid, 0);
    printf("%lld\n", ans);

    return 0;
}