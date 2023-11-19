#include <cstring>
#include <cstdio>
char s[1000002];

int main() {
    int next[1000002];
    scanf("%s", s);
    int len = strlen(s);
    next[0] = 0;
    int k = 0;
    for(int i = 1; i < len; ++i) {
        while(k > 0 && s[i] != s[k]) k = next[k - 1];
        if(s[i] == s[k]) ++k;
        next[i] = k;
    }
    for(int i = 0; i < len; ++i) {
        printf("%d\n", next[i]);
    }
    return 0;
}
