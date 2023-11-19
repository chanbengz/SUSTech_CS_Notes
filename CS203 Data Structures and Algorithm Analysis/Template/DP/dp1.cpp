#include <iostream>
#include <algorithm>
using namespace std;
int n,m,w,v;// v = volume体积, w = wealth价值
int dp[1005];

int main(){
    cin>>n>>m;
    for(int i = 0;i<n;i++) {
        cin>>v>>w;
        for(int j = m;j >= v;j--)
            dp[j] = max(dp[j], dp[j - v] + w);
    }
    cout << dp[m] << endl;
    
    return 0;
}
