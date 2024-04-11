#include <iostream>
#include <queue>
#include <algorithm>
using namespace std;

const int MAX_SIZE = 10005;
int T, n, k, x;
long long max_val = 0, min_val = 0;
priority_queue<int, vector<int>, greater<int> > q_min;
priority_queue<int, vector<int>, less<int> > q_max;

int main() {
    cin >> T;
    while (T--) {
		max_val = min_val = 0;
		while(!q_min.empty()) q_min.pop();
		while(!q_max.empty()) q_max.pop();

		// input
		cin >> n >> k;
        for(int i = 0; i < n; i++) { cin >> x; q_min.push(x); q_max.push(x); }
		
		// get min value
    	while(q_min.size() % (k - 1) != 1) q_min.push(0); // padding 0
		while(q_min.size() > 1) {
			long long sum = 0;
			for(int i = 0; i < k; i++) sum += q_min.top(), q_min.pop(); // merge k min piles
			min_val += sum;
			q_min.push(sum);
		}

		// get max value
		while(q_max.size() > 1) {
			long long sum = 0;
			for(int i = 0; i < 2; i++) sum += q_max.top(), q_max.pop(); // merge 2 max piles
			max_val += sum;
			q_max.push(sum);
    	}

        cout << max_val << ' ' << min_val << endl;
    }

    return 0;
}

/*
sample input:
3
3 4
1 2 3
5 3
4 5 6 3 2
6 4
4 5 6 3 2 10

sample output:
11 6
64 29
120 39
*/
