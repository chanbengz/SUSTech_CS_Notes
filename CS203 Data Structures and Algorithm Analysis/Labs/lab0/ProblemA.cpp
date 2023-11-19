#include<iostream>
using namespace std;

int main() {
	int n;
	cin >> n;
	int nums[n];
	for(int i = 0; i < n; i++) {
		cin >> nums[i];
	}
	int m;
	cin >> m;
	for(int i = 0; i < m; i++) {
		int a;
		cin >> a;
		bool exist = false;
		for(int j = 0; j < n; j++) {
			if(a == nums[j]) exist = true;
		}
		cout << (exist ? "yes" : "no") << endl;
	}
	
	return 0;
}
