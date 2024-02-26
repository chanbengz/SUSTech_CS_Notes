#include<cstdio>

void Hanoi(int n, char a, char b, char c) {
    if (n == 1) {
        printf("Move disk %d from %c to %c\n", n, a, c);
    } else {
        Hanoi(n - 1, a, c, b);
        printf("Move disk %d from %c to %c\n", n, a, c);
        Hanoi(n - 1, b, a, c);
    }
}

int main() {
    Hanoi(3, 'A', 'B', 'C');
    return 0;
}
