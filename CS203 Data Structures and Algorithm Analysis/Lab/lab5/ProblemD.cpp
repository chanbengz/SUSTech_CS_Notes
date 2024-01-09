#include <cstring>
#include <cstdio>
char s[1000002];
int next[1000002];

int main() {
    int t; scanf("%d", &t);
    while(t--) {
        scanf("%s", s);
        int len = strlen(s);
        next[0] = 0;
        int k = 0;
        for(int i = 1; i < len; ++i) {
            while(k > 0 && s[i] != s[k]) k = next[k - 1];
            if(s[i] == s[k]) ++k;
            next[i] = k;
        } 
        int sec = len - next[len - 1];
        int ans = sec - (len % sec);
        if(ans != len && ans == sec) ans = 0;
        printf("%d\n", ans);
    }
    return 0;
}
