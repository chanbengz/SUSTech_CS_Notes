#include <cstdio>
int n;

void sink(int* arr, int index, int length) {
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
    int present = index;

    if (leftChild < length && arr[leftChild] > arr[present]) {
        present = leftChild;
    }

    if (rightChild < length && arr[rightChild] > arr[present]) {
        present = rightChild;
    }

    if (present != index) {
        int temp = arr[index];
        arr[index] = arr[present];
        arr[present] = temp;
        sink(arr, present, length);
    }
}

void buildHeap(int* arr, int length) {
	for (int i = length / 2; i >= 0; i--) {
		sink(arr, i, length);
	}
}

void sort(int* arr) {
    int length = n;
    buildHeap(arr, length);
    for (int i = length - 1; i > 0; i-- ) {
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        length--;
        sink(arr, 0, length);
    }
}

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
	sort(nums);
	int m; scanf("%d", &m);
	for(int i = 0; i < m; i++) {
		int a; scanf("%d", &a);
		bool exist = binary(nums, a);
		printf("%s\n", exist ? "yes" : "no");
	}
	return 0;
}
