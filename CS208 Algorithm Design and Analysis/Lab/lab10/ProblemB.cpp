#include <iostream>
using namespace std;

const int MAXN = 4e5 + 5;
int n, a[MAXN], perm[MAXN];
long long ans;
struct node {
    long long l, r, min, cnt, lazy;
} tree[MAXN << 2];

void build(int root, int l, int r) {
    tree[root].l = l, tree[root].r = r;
    if(l == r) {
        tree[root].cnt = 1;
        return;
    }
    int mid = (l + r) >> 1;
    build(root << 1, l, mid);
    build((root << 1) + 1, mid + 1, r);
    tree[root].min = min(tree[root << 1].min, tree[(root << 1) + 1].min);
    tree[root].cnt = tree[root << 1].cnt * (tree[root << 1].min == tree[root].min) + tree[(root << 1) + 1].cnt * (tree[(root << 1) + 1].min == tree[root].min);
}

void add(int root, int l, int r, int val) {
    if(tree[root].l > r || tree[root].r < l) return;
    if(tree[root].l >= l && tree[root].r <= r) {
        tree[root].min += val;
        tree[root].lazy += val;
        return;
    }
    tree[root << 1].min += tree[root].lazy;
    tree[(root << 1) + 1].min += tree[root].lazy;
    tree[root << 1].lazy += tree[root].lazy;
    tree[(root << 1) + 1].lazy += tree[root].lazy;
    tree[root].lazy = 0;
    add(root << 1, l, r, val);
    add((root << 1) + 1, l, r, val);
    tree[root].min = min(tree[root << 1].min, tree[(root << 1) + 1].min);
    tree[root].cnt = tree[root << 1].cnt * (tree[root << 1].min == tree[root].min) + tree[(root << 1) + 1].cnt * (tree[(root << 1) + 1].min == tree[root].min);
}

long long query(int root, int l, int r) {
    if(tree[root].l > r || tree[root].r < l) return 0;
    if(tree[root].l >= l && tree[root].r <= r) return tree[root].cnt * (tree[root].min <= 1);
    tree[root << 1].min += tree[root].lazy;
    tree[(root << 1) + 1].min += tree[root].lazy;
    tree[root << 1].lazy += tree[root].lazy;
    tree[(root << 1) + 1].lazy += tree[root].lazy;
    tree[root].lazy = 0;
    return query(root << 1, l, r) + query((root << 1) + 1, l, r);
}

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n; for(int i = 1; i <= n; i++) { cin >> a[i]; perm[a[i]] = i; }
    build(1, 1, n);
    for(int i = 1; i <= n; i++) {
        add(1, 1, i, 1);
        if(a[perm[i] - 1] > 0 && a[perm[i] - 1] < i) add(1, 1, a[perm[i] - 1], -1);
        if(a[perm[i] + 1] > 0 && a[perm[i] + 1] < i) add(1, 1, a[perm[i] + 1], -1);
        ans += query(1, 1, i - 1);
    }
    cout << ans + n << endl;

    return 0;
}