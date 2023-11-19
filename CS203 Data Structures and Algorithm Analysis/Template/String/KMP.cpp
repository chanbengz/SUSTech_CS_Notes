#include <cstdio>
char s[10005], t[1000005];
int next[1000002];

void findnext() {
    int len = strlen(s);
    next[0] = 0;
    int k = 0;
    for(int i = 1; i < len; ++i) {
        while(k > 0 && s[i] != s[k]) k = next[k - 1];
        if(s[i] == s[k]) ++k;
        next[i] = k;
    }
}

int kmp() {
    
}

int main() {
    scanf("%s%s", s, t);
    findnext();

}
