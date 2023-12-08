#include<cstdio>
#include<queue>
using std::queue;
const int MAX = 1e5 + 5;
int n, t;

struct Node {
    int val, left, right, fa;
} tree[MAX];

int main() {
    scanf("%d", &t);
    for(int k = 1; k <= t; k++) {
        bool flag = true; scanf("%d", &n);
        for(int i = 1; i <= n; i++) tree[i].val = tree[i].left = tree[i].right = tree[i].fa = 0;
        for(int i = 1; i <= n; i++) scanf("%d", &tree[i].val);
        for(int i = 0; i < n - 1; i++) {
            int x, y; scanf("%d%d", &x, &y);
            if(tree[x].left == 0) tree[x].left = y;
            else if(tree[x].right == 0) tree[x].right = y;
            else flag = false;
            tree[y].fa = x;
        }
        if(!flag) { printf("Case #%d: NO\n", k); continue; }
        int root = 0, next = 0; bool cmp = false;
        for(int i = 1; i <= n; i++) if(tree[i].fa == 0) { root = i; break; }
        queue<int> q; q.push(root);
        while(!q.empty()){
           if (q.front() == 0) break;
           next = q.front(); q.pop();
           q.push(tree[next].left);
           q.push(tree[next].right);
        }
        while (!q.empty()){
            next = q.front(); q.pop();
            if(next != 0){ flag = false; break; }
        }
        if (!flag) { printf("Case #%d: NO\n", k); continue; }
        while(!q.empty()) q.pop();
        q.push(root);
        if (n == 1) { printf("Case #%d: YES\n", k); continue; }
        while (!q.empty()){
            next = q.front(); q.pop();
            if (tree[next].left != 0){
                q.push(tree[next].left);
                if (tree[next].val != tree[tree[next].left].val){
                    cmp = tree[next].val > tree[tree[next].left].val; break;
                }
            }
            if (tree[next].right != 0) {
                q.push(tree[next].right);
                if (tree[next].val != tree[tree[next].left].val){
                    cmp = tree[next].val > tree[tree[next].left].val; break;
                }
            }
        }
        while (!q.empty()) q.pop();
        q.push(root);
        while (!q.empty()){
            next = q.front();q.pop();
            if (tree[next].left != 0){
                q.push(tree[next].left);
                if ((cmp && tree[next].val < tree[tree[next].left].val) || (!cmp && tree[next].val > tree[tree[next].left].val)){
                    flag = false; break;
                }
            }
            if (tree[next].right != 0){
                q.push(tree[next].right);
                if ((cmp && tree[next].val < tree[tree[next].right].val) || (!cmp && tree[next].val > tree[tree[next].right].val)){
                    flag = false; break;
                }
           }
        }
        if(flag) printf("Case #%d: YES\n", k);
        else printf("Case #%d: NO\n", k);
    }
}