#include<cstdio>
char s[100005];

class Node {
    public:
        int val;
        int diff;
        Node *n;
        Node *next;
        Node *prev;
};

Node* arr[5000005];
int n, k;

void sort(int l ,int r){
    if (l == r) return;

    int mid = (l + r) / 2;
    sort(l , mid);
    sort(mid + 1, r);

    int i = l , j = mid + 1, k = 0;
    Node* tmp[r - l + 1];

    while (i <= mid && j <= r){
        if (arr[i]->val <= arr[j]->val) tmp[k++] = arr[i++];
        else tmp[k++] = arr[j++];
    }

    while (i <= mid) tmp[k++] = arr[i++];
    while (j <= r) tmp[k++] = arr[j++];
    for(int x = 0; x < r - l + 1; x++) arr[l + x] = tmp[x];
}

class List {
    public:
        Node *head;
        List();
        void insert(int);
        void insert(Node*);
        void remove(Node*);
};

List::List() {
    this -> head = nullptr;
}

void List::insert(int val) {
    Node *p = new Node;
    p -> val = val;
    p -> n = nullptr;
    p -> next = nullptr;
    p -> prev = nullptr;
    if(this -> head) { p -> n = this -> head -> n; this -> head -> n = p; }
    else this -> head = p;
    arr[k++] = p;
}

void List::insert(Node* p) {
    p -> next = this -> head -> next;
    p -> prev = this -> head;
    if(this -> head -> next) this -> head -> next -> prev = p;
    this -> head -> next = p;
}

void List::remove(Node* p) {
    if(p -> prev) p -> prev -> next = p -> next;
    if(p -> next) p -> next -> prev = p -> prev;
}

int main() {
    int t; scanf("%d", &t);
    while (t--) {
        scanf("%d", &n);
        List list; k = 0;
        list.insert(-1);
        int N = 2 * ((n + 1) / 2) - 1;
        for(int i = 0; i < N; i++) {
            int tmp; scanf("%d", &tmp);
            list.insert(tmp);
        }
        if(n % 2 == 0) {int tmp; scanf("%d", &tmp);}

        sort(1, N);
        int j = 0; int ans[N / 2 + 2];

        for(int i = N; i >= 1; --i) list.insert(arr[i]);
        Node *p = list.head -> n;
        Node *mid = arr[N / 2 + 1];
        int move = 0;
        for(int i = 1; i <= N; i++) {
            if(i & 1) {
                if(move > 0) mid = mid -> next;
                if(move < 0) mid = mid -> prev;
                ans[j++] = mid -> val;
                move = 0;
            }
            if(mid -> val > p -> val) move++;
            else if(mid -> val < p -> val) move--;
            list.remove(p);
            p = p -> n;
        }

        for(int i = j - 1; i >= 0; --i) printf("%d ", ans[i]);
        printf("\n");
    }
    return 0;
}
