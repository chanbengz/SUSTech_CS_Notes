#include<cstdio>
#include<vector>
using std::vector;
const int MAX = 400005;
int n, m, ans;
bool visit[MAX];

class Queue {
    private:
        int front;
        int rear;
        int size;
        int arr[MAX];
    public:
        int n;
        Queue();
        void enque(int);
        int deque();
        bool empty() { return n == 0; }
};

Queue::Queue() {
    this -> size = MAX;
    this -> front = this -> rear = 0;
    this -> n = 0;
}

void Queue::enque(int num) {
    if((rear + 1) % size == front) return;
    arr[rear] = num;
    rear = (rear + 1) % size;
    n++;
}

int Queue::deque() {
    if(n == 0) return -1;
    int tmp = arr[front];
    if(front != rear) front = (front + 1) % size;
    n--;
    return tmp;
}

struct Node {
    int data;
    bool giant;
    vector<int> child;
} arr[MAX];

Queue q; vector<int> v;

int main() {
    scanf("%d", &n);
    for(int i = 0; i < n - 1; i++) {
        int u,v; scanf("%d%d", &u, &v);
        arr[u].child.push_back(v);
        arr[u].giant = false;
        arr[v].child.push_back(u);
        arr[v].giant = false;
    }
    scanf("%d", &m);
    for(int i = 0; i < m; i++) {
        int tmp; scanf("%d", &tmp);
        arr[tmp].giant = true;
    }
    visit[1] = true;
    for(int i = 0; i < arr[1].child.size(); i++) {
        v.clear();
        int now = 0, root = arr[1].child[i];
        arr[root].data = 1;
        visit[root] = true;
        q.enque(root);
        while(!q.empty()) {
            int p = q.deque();
            if(arr[p].giant) v.push_back(arr[p].data);
            for(int j = 0; j < arr[p].child.size(); j++) {
                if(visit[arr[p].child[j]]) continue;
                arr[arr[p].child[j]].data = arr[p].data + 1;
                visit[arr[p].child[j]] = true;
                q.enque(arr[p].child[j]);
            }
        }
        if(!v.empty()) {
            for(int j = 1; j < v.size(); j++) {
                if(v[j] <= v[j - 1]) v[j] = v[j - 1] + 1;
            }
        }
        now = v.back();
        ans = ans >= now ? ans : now;
    }
    printf("%d\n", ans);

    return 0;
}