#include<cstdio>
const int MAX = 5e5 + 5;
int n, m, k, a[MAX], b[MAX], ai, bi;
long long ans[MAX];

void sink(int *arr, int index, int length) {
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
    int present = index;

    if (leftChild < length && arr[leftChild] > arr[present]) {
        present = leftChild;
    }

    if (rightChild < length && arr[rightChild] > arr[present]) {
        present = rightChild;
    }

    if (present != index) {
        int temp = arr[index];
        arr[index] = arr[present];
        arr[present] = temp;
        sink(arr, present, length);
    }
}

void sort(int* arr,int length) {
    for (int i = length / 2; i >= 0; i--) {
        sink(arr, i, length);
    }
    for (int i = length - 1; i > 0; i-- ) {
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        length--;
        sink(arr, 0, length);
    }
}

typedef struct node {
    int a_index, b_index;
    long long val;
    node() {}
    node(int a_ind, int b_ind) {
        a_index = a_ind;
        b_index = b_ind;
        val = (long long) a[a_ind] * b[b_ind];
    }
} Node;

class Heap {
    private:
        Node heap[MAX];
        int size;
    public:
        Heap() : size(0) {}
        void pop() {
            heap[1] = heap[size--];
            int now = 1;
            while(now * 2 <= size) {
                int next = now * 2;
                if(next + 1 <= size && heap[next].val > heap[next + 1].val) next++;
                if(heap[now].val > heap[next].val) {
                    Node tmp = heap[now];
                    heap[now] = heap[next];
                    heap[next] = tmp;
                    now = next;
                }
                else break;
            }
        }

        long long top() {
            return heap[1].val;
        }

        Node top_node() {
            return heap[1];
        }

        void push(int x, int y) {
            heap[++size] = Node(x, y);
            int now = size;
            while(now > 1) {
                int next = now / 2;
                if(heap[now].val < heap[next].val) {
                    Node tmp = heap[now];
                    heap[now] = heap[next];
                    heap[next] = tmp;
                    now = next;
                }
                else break;
            }
        }
};
Heap h;

int main() {
    int j = 0;
    scanf("%d%d%d", &n, &m, &k);
    for(int i = 0; i < n; i++) scanf("%d", &a[i]);
    for(int i = 0; i < m; i++) scanf("%d", &b[i]);
    sort(a, n); sort(b, m);
    for(int i = 0; i < n; i++) h.push(i, 0);
    while(k--) {
        ai = h.top_node().a_index;
        bi = h.top_node().b_index;
        ans[j++] = h.top(); h.pop();
        if(++bi < m) h.push(ai, bi);
    }
    
    for(int i = 0; i < j; i++) printf("%lld ", ans[i]);
    printf("\n");
    return 0;
}