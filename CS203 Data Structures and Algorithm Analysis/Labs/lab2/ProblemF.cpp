#include<cstdio>
long long n, p, q;
long long arr[200005][3];

void sink(int index, int length) {
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
    int present = index;

    if (leftChild < length && arr[leftChild][0] <= arr[present][0]) {
        present = leftChild;
    }

    if (rightChild < length && arr[rightChild][0] <= arr[present][0]) {
        present = rightChild;
    }

    if (present != index) {
        int temp0 = arr[index][0], temp1 = arr[index][1], temp2 = arr[index][2];
        arr[index][0] = arr[present][0], arr[index][1] = arr[present][1], arr[index][2] = arr[present][2];
        arr[present][0] = temp0, arr[present][1] = temp1, arr[present][2] = temp2;
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
        int temp0 = arr[0][0], temp1 = arr[0][1], temp2 = arr[0][2];
        arr[0][0] = arr[i][0], arr[0][1] = arr[i][1], arr[0][2] = arr[i][2];
        arr[i][0] = temp0, arr[i][1] = temp1, arr[i][2] = temp2;
        length--;
        sink(0, length);
    }
}

int main() {
    scanf("%lld%lld%lld", &n, &p, &q);

    for(int i = 0; i < n; ++i) {
        long long h, s;
        scanf("%lld%lld", &h, &s);
        arr[i][0] = h - s;
        arr[i][1] = h;
        arr[i][2] = s;
    }
    
    long long ans = 0, max_ans = 0, last = -1;
    sort(n);

    for(int i = 0; i < n; ++i) {
        if(arr[i][0] > 0 && i < q) {
            ans += arr[i][1];
            last = i;
        } else break;
    }

    for(int i = last + 1; i < n; ++i) ans += arr[i][2];

    if(q == 0) {
        printf("%lld", ans);
        return 0;
    }

    max_ans = ans;
    for(int i = 0; i < n; i++) {
        long long tmp = ans;
        long long new_h = arr[i][1] << p;
        if(i <= last) {
            tmp -= arr[i][1];
            tmp += new_h;
        } else {
            if(last < q - 1) {
                tmp -= arr[i][2];
                tmp += new_h;
            } else {
                tmp -= arr[last][1];
                tmp += arr[last][2];
                tmp -= arr[i][2];
                tmp += new_h;
            }
        }
        max_ans = tmp > max_ans ? tmp : max_ans;
    }

    printf("%lld\n", max_ans);
    
    return 0;
}