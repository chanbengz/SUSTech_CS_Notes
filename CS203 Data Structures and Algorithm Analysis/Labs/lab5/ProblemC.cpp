#include <cstring>
#include <cstdio>
char s[100002];
int fsa[100002][26];

int char2num(char c) { return c - 'a'; }

int main() {
    scanf("%s", s);
    int len = strlen(s);
    int next = 0;
    for(int i = 0; i < len; ++i) {
        fsa[i][char2num(s[i])] = i + 1;
    }

    for(int i = 1; i < len; ++i) {
        for(int j = 0; j < 26; ++j) {
            if(char2num(s[i]) != j)
                fsa[i][j] = fsa[next][j];
            else
                fsa[i][j] = i + 1;
        }
        next = fsa[next][char2num(s[i])];
    }
    
    for(int i = 0; i < len; ++i) {
        for(int j = 0; j < 26; ++j) printf("%d ", fsa[i][j]);
        printf("\n");
    }
    return 0;
}
