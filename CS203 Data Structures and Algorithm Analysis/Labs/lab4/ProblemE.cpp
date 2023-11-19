#include <cstdio>
#define MAX 2000005
int arr[MAX];

class Deque {
    private:
        int front;
        int rear;
        int size;
        int n;
        int a[MAX];
    public:
        Deque();
        void push_front(int);
        void push_back(int);
        int pop_front();
        int pop_back();
        int Front();
        int Back();
        bool empty();
};

Deque::Deque() {
    this -> size = MAX;
    this -> front = this -> rear = 0;
    this -> n = 0;
}

void Deque::push_front(int num) {
    if(n == size) return;
    front = (front - 1 + size) % size;
    a[front] = num;
    n++;
}

void Deque::push_back(int num) {
    if(n == size) return;
    a[rear] = num;
    rear = (rear + 1) % size;
    n++;
}

int Deque::pop_front() {
    if(n == 0) return -1;
    int tmp = a[front];
    front = (front + 1) % size;
    n--;
    return tmp;
}

int Deque::pop_back() {
    if(n == 0) return -1;
    rear = (rear - 1 + size) % size;
    n--;
    return a[rear];
}

int Deque::Front() { return a[front]; }

int Deque::Back() { return a[(rear - 1 + size) % size]; }

bool Deque::empty() { return this -> n == 0; }

int main() {
    int m, tmp, n = 0, k = 0, result = 0;
    scanf("%d", &m);
    for(;;) { scanf("%d", &tmp); if(tmp == -1) break; arr[n++] = tmp; }
    int ans[n + 5];
    Deque q;

    for(int i = 0; i < m; i++) {
        while(!q.empty() && arr[i] >= arr[q.Back()]) q.pop_back();
        q.push_back(i);
    }
    ans[k++] = arr[q.Front()];

    for(int i = m; i < n; i++) {
        while(!q.empty() && arr[i] >= arr[q.Back()]) q.pop_back();
        q.push_back(i);
        while(q.Front() <= i - m) q.pop_front();
        ans[k++] = arr[q.Front()];
    }
    for(int i = 0; i < k; i++) result ^= ans[i];
    printf("%d\n", result);
    return 0;
}
