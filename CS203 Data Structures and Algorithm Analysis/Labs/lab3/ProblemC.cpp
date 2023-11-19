#include<cstdio>
char s[100005];

class Node {
    public:
        int val;
        Node *next;
        Node *prev;
};

Node* arr[100005];
int k, n, m;

void sink(int index, int length) {
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
    int present = index;

    if (leftChild < length && arr[leftChild] -> val > arr[present] -> val) {
        present = leftChild;
    }

    if (rightChild < length && arr[rightChild] -> val > arr[present] -> val) {
        present = rightChild;
    }

    if (present != index) {
        Node* temp = arr[index];
        arr[index] = arr[present];
        arr[present] = temp;
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
        Node* temp = arr[0];
        arr[0] = arr[i];
        arr[i] = temp;
        length--;
        sink(0, length);
    }
}

class List {
    public:
        Node *head;
        Node *tail;
        List();
        void insert(int val);
        Node *findx(int val);
        Node *findy(int val);
        void traverse();
};

List::List() {
    Node *p = new Node;
    p -> val = -2147483646;
    p -> next = nullptr;
    p -> prev = nullptr;
    this -> head = p;
    this -> tail = p;
}

void List::insert(int val) {
    Node *p = new Node;
    p -> val = val;
    p -> next = nullptr;
    p -> prev = this -> tail;
    this -> tail -> next = p;
    this -> tail = p;
    arr[k++] = p;
}

Node* List::findx(int val) {
    int left = 0; int right = n - 1;
	while(right >= left) {
		int mid = left + (right - left) / 2;
		if (arr[mid] -> val == val) return arr[mid] -> prev;
		else if (arr[mid] -> val < val) left = mid + 1;
		else right = mid - 1;
	}
    return nullptr;
}

Node* List::findy(int val) {
    int left = 0; int right = n - 1;
	while(right >= left) {
		int mid = left + (right - left) / 2;
		if (arr[mid] -> val == val) return arr[mid];
		else if (arr[mid] -> val < val) left = mid + 1;
		else right = mid - 1;
	}
    return nullptr;
}

void List::traverse() {
    Node *p = this -> head -> next;
    while(p) {
        if(p -> next) printf("%d ", p -> val);
        else printf("\n");
        p = p -> next;
    }
}

int main() {
    int T; scanf("%d", &T);
    for(int t = 0; t < T; t++) {
        List list; k = 0;
        scanf("%d%d", &n, &m);
        for(int i = 0; i < n; i++) {
            int tmp; scanf("%d", &tmp);
            list.insert(tmp);
        }
        list.insert(2147483646);
        sort(n);
        for(int i = 0; i < m; i++) {
            int x1, y1, x2, y2;
            scanf("%d%d%d%d", &x1, &y1, &x2, &y2);

            Node *p1 = list.findx(x1);
            Node *p2 = list.findy(y1);
            Node *p3 = list.findx(x2);
            Node *p4 = list.findy(y2);
            Node *tmp1 = p1 -> next;
            Node *tmp2 = p2 -> next;

            if (p2 == p3) {
                p3 = p3 -> next;
                p1 -> next = p3;
                p3 -> prev = p1;
                p2 -> next = p4 -> next;
                p4 -> next -> prev = p2;
                p4 -> next = tmp1;
                tmp1 -> prev = p4;
            } else {
                p1 -> next = p3 -> next;
                p3 -> next -> prev = p1;
                p3 -> next = tmp1;
                tmp1 -> prev = p3;
                p2 -> next = p4 -> next;
                p4 -> next -> prev = p2;
                p4 -> next = tmp2;
            }
        }
        list.traverse();
    }
    return 0;
}
