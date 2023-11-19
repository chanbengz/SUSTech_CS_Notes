#include <iostream>
using namespace std;
int n,m,w,v,s;
int dp[1010];

int main(){
    cin>>n>>m;
    for(int i = 0;i < n;i++){
        cin>>v>>w>>s;
        for(int j = m;j >= 0;j--){
            for(int k = 1;k <= s && k*v <= j;k++){
                dp[j] = max(dp[j], dp[j-k*v]+k*w);
            }
        }
    }
    cout<<dp[m]<<endl;
    
    return 0;
}
