#include<cstdio>
#include<cstring>
char s[100], cur[100];
bool vis[100];
int k;

void dfs(int n) {
    if (n == 0) {
        printf("%s ", cur);      // 结束搜索并输出当前排列
    } else {
        for(int i = 0; i < strlen(s); i++) {
            if (!vis[i]) {       // 第i个字符没有被选中
                vis[i] = true;
                cur[k++] = s[i]; // 选中第i个字符
                dfs(n - 1);      // 递归搜索下一个字符
                k--;             // 取消选中
                vis[i] = false;
            }
        }
    }
}

int main() {
    scanf("%s", s);
    dfs(strlen(s));
    printf("\n");
    return 0;
}