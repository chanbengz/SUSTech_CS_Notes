#include <iostream>
using namespace std;

const int MAX_M = 1e5 + 5;
int n, i, m, k, arr[MAX_M];
long long ans;

bool check(long long days) {
	long long day = days >> 1;
	bool night = days & 1;
	long long money = n + i * (day - !night);
	for (int j = 0; j < m; j++) {
		long long price = arr[j] - (day - 1) * k;
		if (price <= 0) {
			if (arr[j] % k) money -= arr[j] % k;
			else money -= k;
		}
		else money -= price;
	}
	return money >= 0;
}

int main() {
	ios_base::sync_with_stdio(false), cin.tie(nullptr), cout.tie(nullptr);
	cin >> n >> i >> m >> k;
	for (int j = 0; j < m; j++) cin >> arr[j];
	long long left = 2, right = 2e11 + 1;
	while(left <= right) {
		long long mid = (left + right) / 2;
		if (check(mid)) {
			right = mid - 1;
			ans = mid;
		} else left = mid + 1;
	}
	cout << (ans >> 1) << ((ans & 1) ? " evening" : " morning") << endl;

	return 0;
}