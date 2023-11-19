#include <iostream>
#include <string>
const unsigned long long seed = 100000007;
unsigned long long hash[1000005];
std::string s1, s2;
int k;

void sink(int index, int length) {
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
    int present = index;

    if (leftChild < length && hash[leftChild] > hash[present]) {
        present = leftChild;
    }

    if (rightChild < length && hash[rightChild] > hash[present]) {
        present = rightChild;
    }

    if (present != index) {
        unsigned long long temp = hash[index];
        hash[index] = hash[present];
        hash[present] = temp;
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
        unsigned long long temp = hash[0];
        hash[0] = hash[i];
        hash[i] = temp;
        length--;
        sink(0, length);
    }
}

bool binary(unsigned long long key) {
    int lo = 0, hi = k - 1;
    while(hi >= lo) {
        int mid = (lo + hi) / 2;
        if (hash[mid] == key) return true;
        else if (hash[mid] < key) lo = mid + 1;
        else hi = mid - 1;
    }
    return false;
}

bool check(int now) {
    k = 0;
    unsigned long long tmp = 0, base = 1, tmp2 = 0;
    for(int i = 0; i < now; i++) tmp = tmp * seed + s1[i];
    hash[k++] = tmp;
    for(int i = 1; i < now; i++) base *= seed;
    for (int i = now; i < s1.length(); i++) {
        tmp = tmp * seed + s1[i] - base * s1[i - now] * seed;
        hash[k++] = tmp;
    }
    sort(k);
    for (int i = 0; i < now; i++) tmp2 = tmp2 * seed + s2[i];
    if(binary(tmp2)) return true;
    for (int i = now; i < s2.length(); i++) {
        tmp2 = tmp2 * seed + s2[i] - base * s2[i - now] * seed;
        if (binary(tmp2)) return true;
    }
    return false;
}

int main() {
    std::cin >> s1 >> s2;
    if(s1.length() > s2.length()) std::swap(s1, s2);
    int left = 0, right = s1.length(), ans;

    while (left <= right) {
        int mid = (left + right) >> 1;
        if (check(mid)) {
            ans = mid;
            left = mid + 1;
        }
        else right = mid - 1;
    }

    std::cout << ans << std::endl;
    return 0;
}

