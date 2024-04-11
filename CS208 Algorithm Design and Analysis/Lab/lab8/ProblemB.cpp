#include <iostream>
#include <queue>
#include <vector>
using namespace std;

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    int T;
    cin >> T;
    while (T--) {
        int n, s;
        cin >> n >> s;
        priority_queue<pair<int, int>> pq;
        for (int i = 0; i < n; i++) {
            int d, s_i;
            cin >> d >> s_i;
            pq.push({d, s_i});
        }
        int count = 0;
        while (!pq.empty()) {
            auto [d, s_i] = pq.top();
            pq.pop();
            s += d;
            if (s >= s_i) {
                count++;
            }
        }
        cout << count << "\n";
    }
    return 0;
}