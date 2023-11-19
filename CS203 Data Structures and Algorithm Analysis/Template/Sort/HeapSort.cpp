#include <cstdio>

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
    int length = 8;
    buildHeap(arr, length);
    for (int i = length - 1; i > 0; i-- ) {
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        length--;
        sink(arr, 0, length);
    }
}

int main() {
    int arr[] = {28, 12, 51, 43, 1, 63, 32, 74};
    int length = 8;
    sort(arr);
    for (int i = 0; i < length; ++i) {
        printf("%d ", arr[i]);
    }
    return 0;
}
