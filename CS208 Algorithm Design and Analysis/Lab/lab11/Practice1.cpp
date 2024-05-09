#include <iostream>
#include <vector>
using namespace std;

const int MAXN = 1e3 + 5;
struct task {
    int a, d, w;
} tasks[MAXN];
int n, penalty, slot[MAXN];
vector<int> unscheduled;

bool cmp(task &a, task &b) { return a.w > b.w; }

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n;
    for(int i = 1; i <= n; i++) { cin >> tasks[i].d; tasks[i].a = i; }
    for(int i = 1; i <= n; i++) { cin >> tasks[i].w; penalty += tasks[i].w; }

    sort(tasks + 1, tasks + n + 1, cmp);
    for(int i = 1; i <= n; i++) {
        bool put = false;
        for(int j = min(n, tasks[i].d); j >= 1; j--) {
            if (!slot[j]) {
                put = true;
                slot[j] = tasks[i].a;
                penalty -= tasks[i].w;
                break;
            }
        }
        if (!put) unscheduled.push_back(tasks[i].a);
    }
    for(int i = 1; i <= n; i++) if(!slot[i]) slot[i] = unscheduled.back(), unscheduled.pop_back();

    for(int i = 1; i <= n; i++) cout << slot[i] << (i == n ? "\n" : " ");
    cout << penalty << endl;

    return 0;
}