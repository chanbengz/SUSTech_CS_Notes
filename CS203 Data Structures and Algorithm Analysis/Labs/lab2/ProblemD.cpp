#include <cstdio>
int arr[1000005];

void sink(int index, int length) {
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
        sink(present, length);
    }
}

void buildHeap(int length) {
    for (int i = length / 2; i >= 0; i--) {
        sink(i, length);
    }
}

void sort(int length) {
    buildHeap(length);
    for (int i = length - 1; i > 0; i-- ) {
        int temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        length--;
        sink(0, length);
    }
}

int main() {
    int n, k; scanf("%d %d", &n, &k);
    for (int i = 0; i < n; ++i) {
        scanf("%d", &arr[i]);
    }
    sort(n);
    printf("%d\n", arr[k - 1]);

    return 0;
}
