#include <cstdio>
#include <cstring>

class Stack{
    private:
        int ptr;
        unsigned long long arr[100005];
    public:
        Stack();
        void push(unsigned long long);
        unsigned long long pop();
};

Stack::Stack() { ptr = 0; }

void Stack::push(unsigned long long num) {
    this -> arr[ptr++] = num;
}

unsigned long long Stack::pop() {
    return this -> arr[--ptr];
}

int main() {
    char c[1000005];
    scanf("%s", c);
    int n = strlen(c);
    unsigned long long ans = 0;
    Stack s;
    for(int i = 0; i < n; i++) {
        if(c[i] == '(') { s.push(ans); ans = 0; }
        else { ans = (s.pop() + (ans == 0 ? 1 : 2 * ans)) % 514329; }
    }

    printf("%d\n", (int)ans % 514329);
    return 0;
}

