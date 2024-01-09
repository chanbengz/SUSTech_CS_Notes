#include <cstdio>

class Stack{
    private:
        int ptr;
        int arr[10005];
    public:
        void push(int);
        int pop();
        int back();
        bool empty();
};

void Stack::push(int num) {
    if(ptr > 10005) return;
    else this->arr[ptr++] = num;
}

int Stack::pop() {
    if(ptr == 0) return -1;
    return this->arr[--ptr];
}

int Stack::back() {
    if(ptr == 0) return -1;
    return this->arr[ptr - 1];
}

bool Stack::empty() {
    return ptr == 0;
}

int hash(char s) {
    switch (s) {
        case '{': return 0;
        case '}': return 1;
        case '(': return 2;
        case ')': return 3;
        case '[': return 4;
        case ']': return 5;
        default: return -1;
    }
}

int main() {
    int t; scanf("%d", &t);
    while(t--) {
        int n; scanf("%d", &n);
        Stack s = Stack(); char c[n + 2];
        scanf("%s", c);
        for (int i = 0; i < n; i++) {
            int h = hash(c[i]);
            if((h & 1) == 0) s.push(h);
            else {
                if(s.empty()) {
                    printf("NO\n");
                    break;
                }
                else {
                    int tmp = s.back();
                    if(tmp == h - 1) s.pop();
                    else {
                        printf("NO\n");
                        break;
                    }
                }
            }
            if(i == n - 1) {
                if(s.empty()) printf("YES\n");
                else printf("NO\n");
            }
        }
    }
    
    return 0;
}
