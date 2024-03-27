#include<iostream>
#include<algorithm>
using namespace std;

const int MAXN = 1e6 + 5;
int T, n, a[MAXN];
long long p, q, c;

int main() {
    std::ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> T;
    while(T--) {
        cin >> n; p = q = 0;
        for (int i = 1; i <= n; i++) cin >> a[i];
        for (int i = 2; i <= n; i++) {
            c = a[i] - a[i - 1];
            if (c > 0) p += c;
            else q -= c;
        }
        cout << max(p, q) << endl;
    }

    return 0;
}