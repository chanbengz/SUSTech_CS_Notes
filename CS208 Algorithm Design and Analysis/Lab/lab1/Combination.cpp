#include<cstdio>
#include<cstring>
char s[100];
bool cur[100];
int n;

void dfs(int k) {
    if(k == n) {        // 打印当前组合
        bool flag = false;
        for(int i = 0; i < n; i++) {
            if(cur[i]) { printf("%c", s[i]); flag = true; }
        }
        if(flag) printf(" ");
    } else {
        cur[k] = false; // 不选第k个字符
        dfs(k + 1);
        cur[k] = true;  // 选第k个字符
        dfs(k + 1);
    }
}

int main() {
    scanf("%s", s);
    n = strlen(s);
    dfs(0);
    printf("\n");
    return 0;
}

// 另外一种写法，不用递归
// 用二进制表示选和不选
/*
int main() {
    scanf("%s", s);
    n = strlen(s);
    for(int i = 1; i < (1 << n); i++) {
        for(int j = 0; j < n; j++) {
            if(i & (1 << j)) printf("%c", s[j]);
        }
        printf(" ");
    }
    printf("\n");
    return 0;
}
*/