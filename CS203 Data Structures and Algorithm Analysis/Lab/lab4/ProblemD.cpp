#include <cstdio>
#define MAX 300005
int arr[MAX], min[MAX];

class Stack{
    private:
        int ptr;
        int a[MAX];
    public:
        Stack();
        void push(int);
        int pop();
        int top();
        bool empty();
};

Stack::Stack() { ptr = 0; }

void Stack::push(int num) {
    if(ptr > MAX) return;
    else this->a[ptr++] = num;
}

int Stack::pop() {
    if(ptr == 0) return -1;
    return this->a[--ptr];
}

bool Stack::empty() { return this -> ptr == 0; }

int Stack::top() {
    if(ptr == 0) return -1;
    return this->a[ptr - 1];
}

int main() {
    int t; scanf("%d", &t);
    while(t--) {
        int n; scanf("%d", &n);
        for(int i = 0; i < n; i++) { scanf("%d", &arr[i]); min[i] = n + 10; }
        min[n] = n + 10;
        for(int i = n - 1; i >= 0; i--) min[i] = arr[i] < min[i + 1] ? arr[i] : min[i + 1];
        Stack s = Stack();
        for(int i = 0; i < n; i++) {
            s.push(arr[i]);
            while(!s.empty() && s.top() <= min[i + 1]) printf("%d ", s.pop());
        }
        while(!s.empty()) printf("%d ", s.pop());
        printf("\n");
    }
    return 0;
}
