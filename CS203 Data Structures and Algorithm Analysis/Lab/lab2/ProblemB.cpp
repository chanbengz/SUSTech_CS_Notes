#include <cstdio>
long arr[5000005];

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
    int n; scanf("%d", &n);
    for (int i = 0; i < n; ++i) {
        scanf("%ld", &arr[i]);
    }
    sort(n);

    if(n % 2 == 1) printf("%ld\n", 2 * arr[n / 2]);
    else printf("%ld\n", arr[n / 2] + arr[n / 2 - 1]);

    return 0;
}
