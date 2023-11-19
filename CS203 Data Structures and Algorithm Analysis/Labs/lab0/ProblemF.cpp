#include <cstdio>
#include <vector>

bool isHu;

void dfs(int cards[5][10], int cnt) {
    if (isHu) return;

    if (cnt == 2) {
        for (int i = 0; i < 4; ++i) {
            for (int j = 0; j < 9; ++j) {
                if (cards[i][j] == 2) {
                    isHu = true;
                    return;
                }
            }
        }
    }

    std::vector<std::vector<int> > shunzi;
    std::vector<std::vector<int> > kezi;
    std::vector<std::vector<int> >::iterator it;


    for (int i = 0; i < 3; ++i) { // zi pai don't have shun
        for (int j = 0; j < 7; ++j) {
            if (cards[i][j] > 0 && cards[i][j + 1] > 0 && cards[i][j + 2] > 0) {
                std::vector<int> tmp; tmp.push_back(i); tmp.push_back(j);
                shunzi.push_back(tmp);
            }
        }
    }

    for (it = shunzi.begin(); it != shunzi.end(); ++it) {
        cards[it->at(0)][it->at(1)] -= 1;
        cards[it->at(0)][it->at(1) + 1] -= 1;
        cards[it->at(0)][it->at(1) + 2] -= 1;
        dfs(cards, cnt - 3);
        if (isHu) return;
        cards[it->at(0)][it->at(1)] += 1;
        cards[it->at(0)][it->at(1) + 1] += 1;
        cards[it->at(0)][it->at(1) + 2] += 1;
    }
    
    for (int i = 0; i < 4; ++i) {
        for (int j = 0; j < 9; ++j) {
            if (cards[i][j] > 2) {
                std::vector<int> tmp; tmp.push_back(i); tmp.push_back(j);
                kezi.push_back(tmp);
            }
        }
    }

    for (it = kezi.begin(); it != kezi.end(); ++it) {
        cards[it->at(0)][it->at(1)] -= 3;
        dfs(cards, cnt - 3);
        if (isHu) return;
        cards[it->at(0)][it->at(1)] += 3;
    }
}

inline int num(char s) {
    switch (s) {
        case 'w': return 0;
        case 'b': return 1;
        case 's': return 2;
        default: return 3;
    }
}

int main() {
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; ++i) {
        int cards[5][10] = {0};
        isHu = false;
        char str[29];
        scanf("%s", str);
        for(int j = 0; j < 28; j += 2) {
            cards[num(str[j + 1])][str[j] - '1'] += 1;
        }
        dfs(cards, 14);
        if (isHu) printf("Blessing of Heaven\n");
        else printf("Bad luck\n");
    }

    return 0;
}
