#include <iostream>
#include <vector>
using namespace std;
int n,m,w,v,s;
int dp[2010];
struct Good{
	int v,w;
};

int main(){
    cin>>n>>m;
    vector<Good> goods;
    for(int i = 0;i < n;i++){
        cin>>v>>w>>s;
        for(int k = 1;k <= s;k *= 2){
            s -= k;
            goods.push_back({v * k, w * k});
        }
        if(s > 0) goods.push_back({v * s, w * s});
    }
    for(auto good: goods)
        for(int j = m;j >= good.v; j--)
            dp[j] = max(dp[j], dp[j - good.v] + good.w);

    cout<<dp[m]<<endl;
    return 0;
}

