#include <cstdio>

int main() {
    int t; scanf("%d", &t);
    for(int i = 0; i < t; i++) {
        int n; scanf("%d", &n);
        int max_dis = -2147483648;
        int max_value; scanf("%d", &max_value);

        for (int j = 1; j < n; j++) {
            int a; scanf("%d", &a);
            int dis = max_value - a;
            max_dis = max_dis < dis ? dis : max_dis;
            max_value = max_value < a ? a : max_value;
        }
        printf("%d\n" ,max_dis);
    }
}

