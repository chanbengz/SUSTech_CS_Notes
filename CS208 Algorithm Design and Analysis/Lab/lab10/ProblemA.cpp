#include <iostream>
#include <algorithm>
using namespace std;

const int MAXN = 4e5 + 5;
long long n, m, a[MAXN];

struct node {
    long long max, maxl, maxr, sum;
} tree[MAXN << 2];

void push(node &root, node l, node r) {
    if(l.maxr < 0 && r.maxl < 0) root.max = max(l.maxr, r.maxl);
    else {
        root.max = 0;
        if(l.maxr > 0) root.max += l.maxr;
        if(r.maxl > 0) root.max += r.maxl;
    }
    root.max = max(root.max, max(l.max, r.max));
    root.maxl = max(l.maxl, l.sum + r.maxl);
    root.maxr = max(r.maxr, r.sum + l.maxr);
    root.sum = l.sum + r.sum;
}

void build(int root, int l, int r) {
    if(l == r) {
        cin >> tree[root].max;
        tree[root].sum = tree[root].maxl = tree[root].maxr = tree[root].max;
        return;
    }
    int mid = (l + r) >> 1;
    build(root << 1, l, mid);
    build((root << 1) + 1, mid + 1, r);
    push(tree[root], tree[root << 1], tree[(root << 1) + 1]);
}

node query(int ql, int qr, int root, int l, int r) {
    if(ql <= l && r <= qr) return tree[root];
    int mid = (l + r) >> 1;
    if(mid >= ql && mid < qr) {
        node res;
        push(res, query(ql, qr, root << 1, l, mid), query(ql, qr, (root << 1) + 1, mid + 1, r));
        return res;
    }
    else if(ql > mid) return query(ql, qr, (root << 1) + 1, mid + 1, r);
    else return query(ql, qr, root << 1, l, mid);
}

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n >> m;
    build(1, 1, n);
    while(m--) {
        long long l, r;
        cin >> l >> r;
        cout << query(l, r, 1, 1, n).max << endl;
    }

    return 0;
}