#include <cstdio>
using namespace std;
int L, n, m, arr[500005];

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

bool valid(int max) {
    int last = 0, count = 0, left = 1, ans = 0;
   
    while(ans < n) {
        int right = n;
        left = ans + 1;
        ans = -1;
        while (left <= right) {
            int mid = (left + right) / 2;
            if (arr[mid] - arr[last] > max) {
                right = mid - 1;
            } else {
                ans = mid;
                left = mid + 1;
            }
        }
        if(ans == -1) return false;
        last = ans;
        count++;
    }
    return ans == n && count <= m;
}

int search() {
    int left = 0, right = L, ans = 0;
    while (left <= right) {
        int mid = (left + right) / 2;
        if (valid(mid)) {
            ans = mid;
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }
    return ans;
}

int main() {
    while(scanf("%d %d %d", &L, &n, &m) != EOF) {
        for(int i = 1; i <= n; ++i) {
            scanf("%d", &arr[i]);
        }
        arr[++n] = L;
        sort(n + 1);
        printf("%d\n", search());
    }

    return 0;
}
