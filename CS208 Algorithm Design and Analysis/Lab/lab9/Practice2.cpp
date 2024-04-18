#include <iostream>
#include <string>
using namespace std;

long long lanran(int l, int r, bool convert) {
    if (l >= r) return !convert;
    int t = 1; while(t < (r + 1)) t <<= 1;
    int mid = t >> 1;
    if(l > mid) return lanran(t - r, t - l, !convert);
    else if(r < mid) return lanran(l, r, convert);
    else if(l == mid) return lanran(t - r, mid - 1, !convert) + !convert;
    else if(r == mid) return lanran(l, mid - 1, convert) + !convert;
    else return lanran(l, mid - 1, convert) + lanran(t - r, mid - 1, !convert) + !convert;
}

int main() {
    int t; cin >> t;
    while(t--) {
        int i, j;
        cin >> i >> j;
        cout << lanran(i, j, false) << endl;
    }

    return 0;
}