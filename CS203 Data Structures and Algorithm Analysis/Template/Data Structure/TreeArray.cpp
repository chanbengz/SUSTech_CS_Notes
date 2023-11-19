#include <iostream>
#define MAXN 10005
using namespace std;

int n,a[MAXN],t[MAXN];

int lowbit(int x){return x & (-x);}

int ask(int x){
	int ans = 0;
	for(; x; x-=lowbit(x)){
		ans += t[x];
	}
	return ans;
}

void add(int x, int k){
	for(;k<=n;k+=lowbit(k)){
		t[k] += x;
	}
}

// add x to a[k]
// add(l,d) add(r+1,-d)

int main(){
	cin >> n;
	for(int i = 1; i <= n;i++) {
		cin >> a[i];
		add(a[i],i);
	}
	add(0,1);add(4,-1);
	for(int i = 1;i<=n;i++) cout<<ask(i)-ask(i-1)<<endl;
	return 0;
}
