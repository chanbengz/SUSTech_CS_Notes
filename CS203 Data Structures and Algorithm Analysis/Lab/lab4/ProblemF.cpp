#include <cstdio>
#define MAX 3000005
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
    int k, n; scanf("%d%d", &k, &n);
    for(int i = 0; i < n; i++) scanf("%d", &arr[i]);
    int left = 0, right = 0, ans = 0;
    Deque min, max;
    while(right < n) {
        while(!max.empty() && max.Back() < arr[right]) max.pop_back();
        while(!min.empty() && min.Back() > arr[right]) min.pop_back();
        max.push_back(arr[right]);
        min.push_back(arr[right]);
        while(!max.empty() && !min.empty() && max.Front() - min.Front() > k) {
            if(arr[left] == min.Front()) min.pop_front();
            if(arr[left] == max.Front()) max.pop_front();
            left++;
        }
        ans = ans > right - left + 1 ? ans : right - left + 1;
        right++;
    }
    printf("%d\n", ans);

    return 0;
}
