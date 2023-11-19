//
//  pack.cpp
//  
//
//  Created by 陈贲 on 2020/2/17.
//

#include <cstdio>
using namespace std;
int t,m,w[105],v[105];//w重量 v价值
int dp[105][1005];//dp[i][j]表示装i个物品背包容量为j的状态

int main(){
    scanf("%d %d", &t, &m);
    for(int i=1;i<=m;i++) scanf("%d %d",&w[i],&v[i]);
    for(int i=1;i<=m;i++) {
        for(int j=t;j>=0;j--) {
            if(j>=w[i]) {
                dp[i][j]=max(dp[i-1][j-w[i]]+v[i],dp[i-1][j]);
            } else {
                dp[i][j]=dp[i-1][j];
            }
        }
    }
    printf("%d",dp[m][t]);
    return 0;
}
