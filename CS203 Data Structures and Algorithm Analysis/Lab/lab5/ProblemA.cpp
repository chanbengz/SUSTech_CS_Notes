#include<cstdio>
#include<cstring>

int main() {
    char s[1005];
    int n;
    scanf("%d", &n);
    for(int i = 0; i < n; i++) {
        scanf("%s", s);
        int len = strlen(s);
        printf("%d\n", (len * len + len) / 2);
    }
}
