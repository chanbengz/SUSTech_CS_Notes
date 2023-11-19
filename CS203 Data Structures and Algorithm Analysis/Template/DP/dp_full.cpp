#include <iostream>
#include <algorithm>
using namespace std;
int n,m,dp[1010],v[1010],w[1010];

int main(){
    cin>>n>>m;
    for(int i = 1;i <= n;i++) cin>>v[i]>>w[i];
    for(int i = 1;i <= n;i++) {
        for(int j = v[i];j<=m;j++)
            dp[j] = max(dp[j],dp[j-v[i]]+w[i]);
    }
    cout<<dp[m]<<endl;
    
    return 0;
}
