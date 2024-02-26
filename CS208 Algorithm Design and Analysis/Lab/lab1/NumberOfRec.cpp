#include<cstdio>

int NumberOfRec(int n) {
    if (n <= 2) {
        return n;
    } else {
        return NumberOfRec(n - 1) + NumberOfRec(n - 2);
    }
}

int main() {
    int n; scanf("%d", &n);
    printf("%d\n", NumberOfRec(n));
    return 0;
}