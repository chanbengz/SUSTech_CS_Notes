#include <iostream>
#include <string>
const unsigned long long seed1 = 998244351;
const unsigned long long seed2 = 100000007;
unsigned long long hash1[1000005];
unsigned long long hash2[1000005];
std::string s1, s2;
int k;

bool binary(unsigned long long key1, unsigned long long key2) {
    int lo = 0, hi = k - 1, mid;
    while(hi >= lo) {
        mid = (lo + hi) / 2;
        if (hash1[mid] == key1) break;
        else if (hash1[mid] < key1) lo = mid + 1;
        else hi = mid - 1;
    }
    if(hash1[mid] != key1) return false;
    lo = 0, hi = k - 1, mid = 0;
    while(hi >= lo) {
        mid = (lo + hi) / 2;
        if (hash2[mid] == key2) return true;
        else if (hash2[mid] < key2) lo = mid + 1;
        else hi = mid - 1;
    }
    return false;
}

bool check(int now) {
    k = 0;
    unsigned long long tmp11 = 0, base1 = 1, base2 = 1, tmp12 = 0, tmp21 = 0, tmp22 = 0;
    for(int i = 0; i < now; i++) {
        tmp11 = tmp11 * seed1 + s1[i];
        tmp12 = tmp12 * seed2 + s1[i];
    }
    hash1[k] = tmp11;
    hash2[k++] = tmp12;
    for(int i = 1; i < now; i++) {
        base2 *= seed2;
        base1 *= seed1;
    }
    for (int i = now; i < s1.length(); i++) {
        tmp11 = tmp11 * seed1 + s1[i] - base1 * s1[i - now] * seed1;
        tmp12 = tmp12 * seed2 + s1[i] - base2 * s1[i - now] * seed2;
        hash1[k] = tmp11;
        hash2[k++] = tmp12;
    }
    std::sort(hash1, hash1 + k);
    std::sort(hash2, hash2 + k);
    for (int i = 0; i < now; i++){
        tmp21 = tmp21 * seed1 + s2[i];
        tmp22 = tmp22 * seed2 + s2[i];
    }
    if(binary(tmp21,tmp22)) return true;
    for (int i = now; i < s2.length(); i++) {
        tmp21 = tmp21 * seed1 + s2[i] - base1 * s2[i - now] * seed1;
        tmp22 = tmp22 * seed2 + s2[i] - base2 * s2[i - now] * seed2;
        if (binary(tmp21,tmp22)) return true;
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

