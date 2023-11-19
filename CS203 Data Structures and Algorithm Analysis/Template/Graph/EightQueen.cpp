#include <cstdio>
using namespace std;
int ans[14], check[3][28] = {0}, sum = 0, n;
void eq(int line) {
  if (line > n) {
    sum++;
    if (sum > 3)
      return;
    else {
      for (int i = 1; i <= n; i++) printf("%d ", ans[i]);
      printf("\n");
      return;
    }
  }
  for (int i = 1; i <= n; i++) {
    if ((!check[0][i]) && (!check[1][line + i]) && (!check[2][line - i + n])) {
      ans[line] = i;
      check[0][i] = 1;
      check[1][line + i] = 1;
      check[2][line - i + n] = 1;
      eq(line + 1);
      check[0][i] = 0;
      check[1][line + i] = 0;
      check[2][line - i + n] = 0;
    }
  }
}
int main() {
  scanf("%d", &n);
  eq(1);
  printf("%d", sum);
  return 0;
}
