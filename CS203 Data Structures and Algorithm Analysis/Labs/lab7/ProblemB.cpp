#include<cstdio>
const int MAX = 3e5 + 5;
int n, size, heap[MAX];

int main() {
    scanf("%d", &n);
    for(int i = 1; i <= n; i++) {
        int ans = 0, now = i;
        scanf("%d", &heap[i]);
        while(now != 1){
            if (heap[now] > heap[now / 2]){
                int temp = heap[now];
                heap[now] = heap[now / 2];
                heap[now / 2] = temp;
                ans++;
            } else break;
            now /= 2;
        }
        printf("%d ", ans);
    }
    printf("\n");
    return 0;
}