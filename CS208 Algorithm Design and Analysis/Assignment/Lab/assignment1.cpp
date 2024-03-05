#include <cstdio>
#include <queue>
#include <vector>
#include <string>
#include <unordered_map>
using std::queue;
using std::vector;
using std::unordered_map;
using std::string;
int n; vector<vector<int> > S;

char boy[1002][11], girl[1002][11];
int boylist[1002][1002], girllist[1002][1002];
int husband[1002], boy_pointer[1002];
unordered_map<string, int> hash;

void solve() {
    queue<int> freeman;
    for (int i = 0; i < n; i++) { freeman.push(i); husband[i] = -1; }
    while (!freeman.empty()) {
        int m = freeman.front();
        int w = boylist[m][boy_pointer[m]++];
        if (husband[w] == -1) {
            husband[w] = m;
            freeman.pop();
            S.push_back({m, w});
        } else {
            if (girllist[w][husband[w]] > girllist[w][m]) {
                int s_index;
                for (s_index = 0; s_index < S.size(); s_index++) if(S[s_index][1] == w) break;
                int old = S[s_index][0];
                S.erase(S.begin() + s_index);
                S.push_back({m, w});
                freeman.pop();
                freeman.push(old);
                husband[w] = m;
            }
        }
    }
    
    for(int i = 0; i < n; i++) {
        printf("%s %s\n", boy[S[i][0]], girl[S[i][1]]);
    }
}

int main() {
    scanf("%d", &n);
    for (int i = 0; i < n; i++) { scanf("%s", boy[i]); hash[ string(boy[i]) ] = i; }
    for (int i = 0; i < n; i++) { scanf("%s", girl[i]); hash[ string(girl[i]) ] = i; }
    char tmp[11];
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%s", tmp);
            boylist[i][j] = hash[string(tmp)];
        }
    }
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%s", tmp);
            girllist[i][hash[string(tmp)]] = j;
        }
    }

    solve();
    return 0;
}
