#include <cstdio>
long x1, y1, x2, y2, dx, dy, n;
char step[1000005];
int circ[1000005];

int direc[4][2] = {
	{0, 1}, {0, -1},
	{-1, 0}, {1, 0}
};

int todirec(char s) {
	switch(s) {
		case 'U': return 0;
		case 'D': return 1;
		case 'L': return 2;
		default: return 3;
	}
}

long abs(long a) { return a >= 0 ? a : -a; }

bool check(long step) {
	long x2t = x2 + (step / n) * dx;
	long y2t = y2 + (step / n) * dy;
	for(int i = 0; i < step % n; ++i) {
		x2t += direc[circ[i]][0];
		y2t += direc[circ[i]][1];
	}

	return abs(x1 - x2t) + abs(y1 - y2t) <= step;
}

int main() {
	scanf("%ld %ld", &x1, &y1);
	scanf("%ld %ld", &x2, &y2);
	scanf("%ld", &n);
	scanf("%s", step);
	for(int i = 0; i < n; ++i) {
		circ[i] = todirec(step[i]);
		dx += direc[circ[i]][0];
		dy += direc[circ[i]][1];
	}

	long left = 0, right = n * 1000000000ll, ans = -1;
    while (left <= right) {
        long mid = (left + right) / 2;
        if (check(mid)) {
            ans = mid;
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }

    printf("%ld\n", ans);
	
	return 0;
}
