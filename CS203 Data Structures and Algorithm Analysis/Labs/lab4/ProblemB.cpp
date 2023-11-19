#include <cstdio>
int times[1000000];
bool visit[1000000];

class Queue {
    private:
        int front;
        int rear;
        int size;
        int arr[1000000];
    public:
        int n;
        Queue();
        void enque(int);
        int deque();
        int Front();
        bool empty();
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

bool Queue::empty() { return this -> n == 0; }
int Queue::Front() { if(empty()) return -1; return arr[front]; }

int main() {
    int n, p, q;
    scanf("%d %d %d", &n, &p, &q);
    Queue q1, q2;
    for(int i = 0; i < p; i++) { int tmp; scanf("%d", &tmp); q1.enque(tmp); }
    for(int i = 0; i < q; i++) { int tmp; scanf("%d", &tmp); q2.enque(tmp); }
    
    for(int i = 1; i<= n; i++) {
        while(visit[q1.Front()]) q1.deque();
        while(visit[q2.Front()]) q2.deque();
        if(q1.Front() != -1) {
            visit[q1.Front()] = true;
            times[q1.deque()] = i;
        }
        if(q2.Front() != -1) {
            visit[q2.Front()] = true;
            times[q2.deque()] = i;
        }

        if(q1.empty() && q2.empty()) break;
    }

    for(int i = 1; i <= n; i++) {
        printf("%d ", times[i]);
    }
    printf("\n");
    return 0;
}
