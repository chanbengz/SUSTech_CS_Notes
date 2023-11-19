#include <cstdio>

int main() {
    int n; scanf("%d", &n);
    unsigned long long s, ans = 0; scanf("%lld", &s);
    unsigned long long arr[n];

    for (int i = 0; i < n; ++i) {
        scanf("%lld", &arr[i]);
    }

    for (int i = 0; i < n; ++i) {
        if (arr[i] > s) break;
        int left = i + 1, right = n - 1;

        while(left < right) {
            if(arr[i] + arr[left] + arr[right] < s) left++;
            else if(arr[i] + arr[left] + arr[right] > s) right--;
            else { // find one
                if(arr[left] != arr[right]) {
                    int dup_left = 1, dup_right = 1;
                    while(left + 1 < right && arr[left] == arr[left + 1]) {left++; dup_left++;}
                    while(left < right - 1 && arr[right - 1] == arr[right]) {right--; dup_right++;}
                    ans += dup_left * dup_right;
                    left++;
                    right--;
                } else { // a[j] = a[k]
                    int m = right - left + 1;
                    ans += (m - 1) * m / 2;
                    break; // they're the same
                }
            }
        }
    }
    
    printf("%lld\n", ans);

    return 0;
}
