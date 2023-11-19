//
//  快速幂.cpp
//  
//
//  Created by 陈贲 on 2020/2/6.
//

#include <iostream>
using namespace std;

int pow(long long a, int b, int mod){
    long long ans=1, res=a;
    while(b){
        if(b&1) ans=ans*res%mod;
        res=res*res%mod;
        b>>=1;
    }
    return ans%mod;
}

int main(){
    //cout<<pow()<<endl;
    return 0;
}
