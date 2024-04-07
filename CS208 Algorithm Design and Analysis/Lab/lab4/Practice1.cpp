#include <iostream>
#include <vector>
#include <queue>
using std::cin;
using std::cout;
using std::endl;
using std::queue;
using std::vector;

const int MAX_SIZE = 10005;
int N, ck_points[MAX_SIZE + 1], holes[MAX_SIZE + 1], d[MAX_SIZE + 1];
vector<int> g[MAX_SIZE + 1];

void dijkstra();

int main()
{
    std::ios_base::sync_with_stdio(0), std::cin.tie(0), std::cout.tie(0); 
    cin >> N;
    for (int i = 1; i <= N; ++i) d[i] = N;
    for (int i = 1; i <= N; ++i) cin >> ck_points[i];
    for (int i = 1; i <= N; ++i) cin >> holes[i];

    if (N > 1) {
        g[1].push_back(ck_points[2]);
        g[N].push_back(ck_points[N - 1]);
        for (int i = 2; i <= N - 1; ++i) {
            g[i].push_back(ck_points[i - 1]);
            g[i].push_back(ck_points[i + 1]);
        }
        for (int i = 1; i <= N; ++i) g[i].push_back(holes[i]);

        dijkstra();
    } else { cout << 0 << endl; }

    return 0;
}

void dijkstra()
{
    queue<int> q;
    q.push(1); d[1] = 0;
    while (!q.empty()) {
        int p = q.front(); q.pop();
        for (int c: g[p]) {
            if (d[p] + 1 < d[c]) {
                d[c] = d[p] + 1;
                q.push(c);
            }
        }
    }
    
    for (int i = 1; i <= N; ++i) cout << d[i] << ' ';
    cout << endl;
}