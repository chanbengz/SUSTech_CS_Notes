#include<cstdio>
#include<vector>
using std::vector;
const int MAX = 200005;
int n, root;
long long ans, tmparr[MAX];

void sink(int index, int length) {
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
    int present = index;

    if (leftChild < length && tmparr[leftChild] > tmparr[present]) {
        present = leftChild;
    }

    if (rightChild < length && tmparr[rightChild] > tmparr[present]) {
        present = rightChild;
    }

    if (present != index) {
        int temp = tmparr[index];
        tmparr[index] = tmparr[present];
        tmparr[present] = temp;
        sink(present, length);
    }
}

void buildHeap(int length) {
    for (int i = length / 2; i >= 0; i--) {
        sink(i, length);
    }
}

void sort(int length) {
    buildHeap(length);
    for (int i = length - 1; i > 0; i-- ) {
        int temp = tmparr[0];
        tmparr[0] = tmparr[i];
        tmparr[i] = temp;
        length--;
        sink(0, length);
    }
}
 
struct Node {
    int p, maxval;
    long long a, b, ans;
    vector<int> child;
} arr[MAX];
 
int max(int a, int b) { return a > b ? a : b; }
long long min(long long a, long long b) { return a < b ? a : b; }
 
void dfs(int now, int last) {
    arr[now].maxval = 0;
    arr[now].ans = 0;
    for(int i = 0; i < arr[now].child.size(); i++) {
        if(arr[now].child[i] == last) continue;
        dfs(arr[now].child[i], now);
        arr[now].ans += arr[arr[now].child[i]].ans;
        arr[now].maxval = max(arr[now].maxval, arr[arr[now].child[i]].maxval);
    }
    if(arr[now].maxval < arr[now].p) {
        arr[now].ans += arr[now].p - arr[now].maxval;
        arr[now].maxval = arr[now].p;
    }
}
 
int main() {
    scanf("%d", &n);
    for(int i = 0; i < n - 1; i++) {
        int u,v; scanf("%d%d", &u, &v);
        arr[u].child.push_back(v);
        arr[v].child.push_back(u);
    }
 
    for(int i = 1; i <= n; i++) {
        scanf("%d", &arr[i].p);
        if(arr[i].p > arr[root].p) root = i;
    }
 
    dfs(root, 0);
    for(int i = 0; i < arr[root].child.size(); i++) {
        arr[arr[root].child[i]].a = arr[arr[root].child[i]].ans;
        arr[arr[root].child[i]].p = arr[root].p;
        dfs(arr[root].child[i], root);
        arr[arr[root].child[i]].b = arr[arr[root].child[i]].ans;
    }
    int k = 0;
    for(int i = 0; i < arr[root].child.size(); i++) { 
        ans += arr[arr[root].child[i]].a;
        tmparr[k++] = arr[arr[root].child[i]].b - arr[arr[root].child[i]].a;
    }
    sort(k);
    ans += arr[root].p + tmparr[0];
    if(k > 1) ans = min(ans, ans - arr[root].p + tmparr[1]);
    printf("%lld\n", ans);
 
    return 0;
}