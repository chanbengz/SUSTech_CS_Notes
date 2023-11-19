#include <cstdio>
int n;

bool binary(int* nums, int key) {
	int lo = 0; int hi = n - 1;
		while(hi >= lo) {
			int mid = lo + (hi - lo) / 2;
			if (nums[mid] == key) return true;
			else if (nums[mid] < key) lo = mid + 1;
			else hi = mid - 1;
		}
	return false;
}

int main() {
	scanf("%d", &n);
	int nums[n];
	for(int i = 0; i < n; i++) {
		scanf("%d", &nums[i]);
	}
	int m; scanf("%d", &m);
	for(int i = 0; i < m; i++) {
		int a; scanf("%d", &a);
		bool exist = binary(nums, a);
		printf("%s\n", exist ? "YES" : "NO");
	}
	return 0;
}
