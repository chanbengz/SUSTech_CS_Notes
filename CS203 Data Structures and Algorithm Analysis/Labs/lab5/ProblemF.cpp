#include <cstring>
#include <cstdio>
char s[500005], cipher[27];
int next[1000002];

char cipher2txt(char c) {
    return cipher[c - 'a'] + 'a';
}

int main() {
    for(int i = 0; i < 26; i++) {
        char tmp[2]; scanf("%s", tmp);
        cipher[tmp[0] - 'a'] = i;
    }
    scanf("%s", s);
    int length = strlen(s);
    int len = length, j = 0, k = -1;
    len = (len + 1) / 2;
    for(int i = 0; i < len; i++) s[i] = cipher2txt(s[i]);

    next[0] = -1;
    while (j < length) {
        if (k == -1 || s[k] == s[j]) next[++j] = ++k;
        else k = next[k];
    }

    int ans = next[length];
    if(ans > length / 2) ans = length / 2;
    ans = length - ans;
    printf("%d\n", ans);
    
    return 0;
}
