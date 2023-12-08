#include<cstdio>
const int MAX = 5e5 + 5;
int n;

struct Node {
    int val, left, right;
    bool deleted;
} tree[MAX];

class Heap {
    private:
        int heap[MAX], size;
    public:
        Heap() : size(0) {}
        int pop() {
            int p = heap[1];
            heap[1] = heap[size--];
            int now = 1;
            while(now * 2 <= size) {
                int next = now * 2;
                if(next + 1 <= size && (tree[heap[next]].val > tree[heap[next + 1]].val || (tree[heap[next]].val == tree[heap[next + 1]].val && heap[next] > heap[next + 1]))) next++;
                if(tree[heap[now]].val > tree[heap[next]].val || (tree[heap[now]].val == tree[heap[next]].val && heap[now] > heap[next])) {
                    int temp = heap[now];
                    heap[now] = heap[next];
                    heap[next] = temp;
                    now = next;
                }
                else break;
            }
            return tree[p].deleted ? pop() : p;
        }

        void push(int x) {
            heap[++size] = x;
            int now = size;
            while(now > 1) {
                int next = now / 2;
                if(tree[heap[next]].val > tree[heap[now]].val || (tree[heap[next]].val == tree[heap[now]].val && heap[next] > heap[now])) {
                    int temp = heap[now];
                    heap[now] = heap[next];
                    heap[next] = temp;
                    now = next;
                }
                else break;
            }
        }
};
Heap h;

int main() {
    scanf("%d", &n);
    for(int i = 1; i <= n; i++) {
        scanf("%d", &tree[i].val);
        tree[i].left = i - 1;
        tree[i].right = i + 1;
        h.push(i);
    } tree[0].right = 1; tree[n].right = 0;
    while(--n) {
        int p = h.pop();
        int left = tree[p].left, right = tree[p].right;
        if(left && right) {
            if((tree[p].val ^ tree[left].val) >= (tree[p].val ^ tree[right].val)) {
                tree[p].val = (tree[p].val ^ tree[left].val) + 1;
                h.push(p);
                tree[p].left = tree[left].left;
                if(tree[left].left) tree[tree[left].left].right = p;
                tree[left].deleted = true;
            } else {
                tree[p].val = (tree[p].val ^ tree[right].val) + 1;
                h.push(p);
                tree[p].right = tree[right].right;
                if(tree[right].right) tree[tree[right].right].left = p;
                tree[right].deleted = true;
            }
            continue;
        }
        if(left) {
            tree[p].val = (tree[p].val ^ tree[left].val) + 1;
            h.push(p);
            tree[p].left = tree[left].left;
            if(tree[left].left) tree[tree[left].left].right = p;
            tree[left].deleted = true;
        }
        else if(right) {
            tree[p].val = (tree[p].val ^ tree[right].val) + 1;
            h.push(p);
            tree[p].right = tree[right].right;
            if(tree[right].right) tree[tree[right].right].left = p;
            tree[right].deleted = true;
        }
    }
    printf("%d\n", tree[h.pop()].val);

    return 0;
}