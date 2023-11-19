#define N 100
#include <iostream>
using namespace std;

int BinarySearch(int* nums, int key);

int main(int argc, char const *argv[])
{
	int nums[N], i;
	for (i = 0;i < N;i++)
		cin>>nums[i];
	int key = 55;
	cout << BinarySearch(nums, key);

	return 0;
}


int BinarySearch(int* nums, int key) {
	int lo = 0; int hi = 99;
	int mid = (hi + lo) / 2;
	while(hi>lo) {
		mid = lo + (mid + hi) / 2;
		if (nums[mid] == key) return mid;
		else if (nums[mid] < key) lo = mid + 1;
		else hi = mid - 1;
	}

	return -1;
}
