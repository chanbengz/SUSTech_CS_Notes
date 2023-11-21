#include<cstdio>
int ans, n;

class Heap {
    private:
        int heap[1005], size;
    public:
        Heap() : size(0) {}
        void pop() {
            heap[1] = heap[size--];
            int now = 1;
            while(now * 2 <= size) {
                int next = now * 2;
                if(next + 1 <= size && heap[next] > heap[next + 1]) next++;
                if(heap[now] > heap[next]) {
                    int temp = heap[now];
                    heap[now] = heap[next];
                    heap[next] = temp;
                    now = next;
                }
                else break;
            }
        }

        int top() {
            return heap[1];
        }

        void push(int x) {
            heap[++size] = x;
            int now = size;
            while(now > 1) {
                int next = now / 2;
                if(heap[now] < heap[next]) {
                    int temp = heap[now];
                    heap[now] = heap[next];
                    heap[next] = temp;
                    now = next;
                }
                else break;
            }
        }
};

int main() {
    int T;
    scanf("%d", &T);
    while(T--) {
        scanf("%d", &n);
        Heap h; ans = 0;
        for(int i = 0; i < n; i++) {
            int tmp;
            scanf("%d", &tmp);
            h.push(tmp);
        }
        for(int i = 0; i < n - 1; i++) {
            int x = h.top(); h.pop();
            int y = h.top(); h.pop();
            ans += x + y;
            h.push(x + y);
        }
        printf("%d\n", ans);
    }
    return 0;
}