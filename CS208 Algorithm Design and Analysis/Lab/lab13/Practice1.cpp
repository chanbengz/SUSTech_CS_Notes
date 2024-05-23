#include <iostream>
using namespace std;

const int MAXN = 1e3;
int arr[MAXN], n;

int dp() {
    int pre = 0, ans = arr[0];
    for(int i = 0; i < n; i++) {
        pre = max(pre + arr[i], arr[i]);
        ans = max(ans, pre);
    }
    return ans;
}

int greedy() {
    int sum = arr[0], ans = arr[0];
    for(int i = 1; i < n; i++) {
        if(sum <= 0) sum = 0;
        sum += arr[i];
        ans = max(ans, sum);
    }
    return ans;
}

struct node {
    int lSum, rSum, mSum, iSum;
};

node pushUp(node l, node r) {
    int iSum = l.iSum + r.iSum;
    int lSum = max(l.lSum, l.iSum + r.lSum);
    int rSum = max(r.rSum, r.iSum + l.rSum);
    int mSum = max(max(l.mSum, r.mSum), l.rSum + r.lSum);
    return (node) {lSum, rSum, mSum, iSum};
};

node get(int l, int r) {
    if (l == r) {
        return (node) {arr[l], arr[l], arr[l], arr[l]};
    }
    int m = (l + r) >> 1;
    node lSub = get(l, m);
    node rSub = get(m + 1, r);
    return pushUp(lSub, rSub);
}

int divide() {
    return get(0, n - 1).mSum;
}

int main() {
    ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
    cin >> n;
    for(int i = 0; i < n; i++) cin >> arr[i];

    cout << "dynamic: " << dp() << endl;
    cout << "greedy:  " << greedy() << endl;
    cout << "divide:  " << divide() << endl;

    return 0;
}