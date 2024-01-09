#include <cstdio>

int main() {
	int t; scanf("%d", &t);
	for (int i = 0; i < t; ++i) {
		int x, y, z; scanf("%d %d %d", &x, &y, &z);
		int lenx = 2 * (z + y) + 1, leny = 2 * (x + y) + 1;
		char cuboid[lenx][leny];
		for (int j = 0; j < lenx; ++j) {
			for (int k = 0; k < leny; ++k) {
				cuboid[j][k] = '.';
			}
		}

		// front
		for (int j = 2 * y; j < lenx - 1; j += 2) {
			for (int k = 0; k < 2 * x; k += 2) {
				cuboid[j][k] = '+';
				cuboid[j][k + 1] = '-';
			}
			cuboid[j][2 * x] = '+';
			for (int k = 0; k < 2 * x; k += 2) {
				cuboid[j + 1][k] = '|';
			}
			cuboid[j + 1][2 * x] = '|';
		}
		for (int k = 0; k < 2 * x; k += 2) {
			cuboid[lenx - 1][k] = '+';
			cuboid[lenx - 1][k + 1] = '-';
		}
		cuboid[lenx - 1][2 * x] = '+';

		// top
		for (int j = 0; j < 2 * y; j += 2) {
			for (int k = 2 * y - j; k < leny - j - 1; k += 2) {
				cuboid[j][k] = '+';
				cuboid[j][k + 1] = '-';
			}
			cuboid[j][leny - j - 1] = '+';
			for (int k = 2 * y - j - 1; k < leny - j - 2; k += 2) {
				cuboid[j + 1][k] = '/';
			}
			cuboid[j + 1][leny - j - 2] = '/';
		}

		// beside
		for (int j = 2 * x + 1; j < leny; j += 2) {
			for (int k = 2 * (y + x + 1) - j; k < lenx + 2 * x - j; k += 2) {
				cuboid[k][j] = '/';
			}
			for (int k = 2 * (y + x) - j; k < lenx + 2 * x - 2 - j; k += 2) {
				cuboid[k][j + 1] = '|';
				cuboid[k + 1][j + 1] = '+';
			}
		}

		for (int j = 0; j < lenx; ++j) {
			for (int k = 0; k < leny; ++k) {
				printf("%c", cuboid[j][k]);
			}
			printf("\n");
		}
	}
}