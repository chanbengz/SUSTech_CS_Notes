#include <cstdio>
unsigned int n;

unsigned long long search_left(unsigned long long* arr, unsigned long target) {
    unsigned long long left = 0, right = n;
    while (left < right) {
        unsigned long long mid = (left + right) / 2;
        if (arr[mid] <= target) left = mid + 1;
        else right = mid;
    }
    return left;
}

unsigned long long search_right(unsigned long long* arr, unsigned long target) {
    unsigned long long left = 0, right = n;
    while (left < right) {
        unsigned long long mid = (left + right) / 2;
        if (arr[mid] < target) left = mid + 1;
        else right = mid;
    }
    return left - 1;
}

int main() {
    unsigned int t;
    scanf("%d %d", &n, &t);
    unsigned long long arr[n];
    for(int i = 0; i < n; ++i) scanf("%lld", &arr[i]);

    for(int i = 0; i < t; ++i) {
        unsigned long long x, y;
        scanf("%lld %lld", &x, &y);

        unsigned long long le = search_left(arr, x);
        unsigned long long ri = search_right(arr, y);
        long long ans = ri - le + 1;
        if(ans < 1ll) printf("NO\n");
        else printf("YES %lld\n", ans);
    }

    return 0;
}
