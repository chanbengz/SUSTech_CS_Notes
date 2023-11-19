#include<cstdio>
int n, arr[10000005], tmp[10000005];

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

void heap_sort(int length) {
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
    scanf("%d", &n);
    for(int i = 0; i < n; ++i) {
        scanf("%d", &arr[i]);
    }
    heap_sort(n);

    if(n == 3) {
        printf("%d\n", arr[1]);
        printf("%d %d %d\n", arr[0], arr[1], arr[2]);
        return 0;
    }

    tmp[0] = arr[0], tmp[n - 1] = arr[n - 1];
    int mid = n / 3, k = 2;

    while(arr[mid] == arr[mid - 1] && mid > 1) mid--;
    tmp[1] = arr[mid];

    int i = 1, j = mid + 1;

    while(i < mid && k < n - 1) {
        tmp[k++] = arr[j++];
        if(i < mid && j < n - 1) tmp[k++] = arr[i++];
        if(i < mid && j < n - 1) tmp[k++] = arr[j++];
    }

    while(j < n - 1) tmp[k++] = arr[j++];

    printf("%d\n", arr[mid]);
    for (int i = 0; i < n - 1; ++i) {
        printf("%d ", tmp[i]);
    }
    printf("%d\n", tmp[n - 1]);
    
    return 0;
}
