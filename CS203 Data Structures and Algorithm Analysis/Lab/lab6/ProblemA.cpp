#include<cstdio>
#include<vector>
int n, k, ans[1000005];
bool visit[1000005];
using std::vector;

class Queue {
    private:
        int front;
        int rear;
        int size;
        int arr[1000005];
    public:
        int n;
        Queue();
        void enque(int);
        int deque();
};

Queue::Queue() {
    this -> size = 1000000;
    this -> front = this -> rear = 0;
    this -> n = 0;
}

void Queue::enque(int num) {
    if((rear + 1) % size == front) return;
    arr[rear] = num;
    rear = (rear + 1) % size;
    n++;
}

int Queue::deque() {
    if(n == 0) return -1;
    int tmp = arr[front];
    if(front != rear) front = (front + 1) % size;
    n--;
    return tmp;
}

struct Node {
    int data;
    vector<int> child;
} arr[1000005];

int main() {
    scanf("%d", &n);
    Queue q;
    for(int i = 0; i < n - 1; i++) {
        int a, b;
        scanf("%d%d", &a, &b);
        arr[a].child.push_back(b);
        arr[b].child.push_back(a);
    }
    q.enque(1);
    visit[1] = true;
    for(int i = 1; i <= n; i++) {
        int tmp = q.deque();
        if(arr[tmp].child.size() == 1) { ans[tmp] = 1; continue; }
        for(int j = 0; j < arr[tmp].child.size(); j++) {
            if(visit[arr[tmp].child[j]]) continue;
            q.enque(arr[tmp].child[j]);
            visit[arr[tmp].child[j]] = true;
        }
    }
    for(int i = 0; i < 1000005; i++) {
        if(ans[i] != 0) printf("%d ", i);
    }
    printf("\n");

    return 0;
}