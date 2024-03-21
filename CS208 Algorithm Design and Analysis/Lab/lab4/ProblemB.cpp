#include <iostream>
#include <queue>
using std::cin;
using std::cout;
using std::queue;
using std::endl;

struct cell {
	int x, y;
	int dis;
	cell() {}
	cell(int x, int y, int dis)
		: x(x)
		, y(y)
		, dis(dis) { }
};

int N, knightPos[2], targetPos[2];

bool isInside(int x, int y)
{
	return x >= -N/2 && x <= N/2 && y >= -N/2 && y <= N/2;
}

int find()
{
	int dx[] = { -2, -1, 1, 2, -2, -1, 1, 2 };
	int dy[] = { -1, -2, -2, -1, 1, 2, 2, 1 };

	queue<cell> q;
	q.push(cell(knightPos[0], knightPos[1], 0));

	cell t;
	int x, y;
	bool visit[N + 1][N + 1];

	for (int i = 1; i <= N; i++)
		for (int j = 1; j <= N; j++)
			visit[i][j] = false;

	visit[knightPos[0]][knightPos[1]] = true;
	while (!q.empty()) {
		t = q.front();
		q.pop();

		if (t.x == targetPos[0] && t.y == targetPos[1])
			return t.dis;

		for (int i = 0; i < 8; i++) {
			x = t.x + dx[i];
			y = t.y + dy[i];

			if (isInside(x, y) && !visit[x][y]) {
				visit[x][y] = true;
				q.push(cell(x, y, t.dis + 1));
			}
		}
	}

    return -1;
}

int main()
{
	cin >> N;
    cin >> knightPos[0] >> knightPos[1];
    cin >> targetPos[0] >> targetPos[1];
	cout << find() << endl;;
	return 0;
}
