#include <cstdio>
#include <algorithm>
using namespace std;
int L, n, m, arr[500005];

bool check(int max) {
    int last = 0, count = 1;
    for(int i = 1; i <= n; ++i) {
        if(arr[i] - arr[last] > max) {
            if(last == i - 1) return false;
            last = i - 1;
            count++;
            i--;
        }
    }
    return count <= m;
}

int search() {
    int ans = 1;
    while(ans <= L) {
        if(check(ans)) return ans;
        ans++;
    }
    return -1;
}

int main() {
    while(scanf("%d %d %d", &L, &n, &m) != EOF) {
        for(int i = 1; i <= n; ++i) {
            scanf("%d", &arr[i]);
        }
        arr[++n] = L;
        sort(arr + 1, arr + n + 1);
        printf("%d\n", search());
    }

    return 0;
}
