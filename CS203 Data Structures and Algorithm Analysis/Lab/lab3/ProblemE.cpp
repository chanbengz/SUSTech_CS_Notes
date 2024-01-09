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
        void insert(int);
        void insert(Node* );
        void remove(Node* );
        void traverse();
};
 
List::List() {
    this -> head = nullptr;
    this -> tail = nullptr;
}
 
void List::insert(int val) {
    Node *p = new Node;
    p -> val = val;
    p -> n = nullptr;
    p -> next = nullptr;
    p -> prev = nullptr;
    if(this -> head == nullptr) this -> head = p;
    if(this -> tail) this -> tail -> n = p;
    this -> tail = p;
    arr[k++] = p;
}
 
void List::insert(Node* p) {
    if(this -> head == nullptr) this -> head = p;
    p -> prev = this -> tail;
    if(this -> tail) this -> tail -> next = p;
    this -> tail = p;
}
 
void List::remove(Node* p) {
    if(p -> prev) p -> prev -> next = p -> next;
    if(p -> next) p -> next -> prev = p -> prev;
}
 
void List::traverse() {
    Node *p = this -> head -> n;
    while(p) {
        if(p -> n) printf("%d ", p -> diff);
        else printf("\n");
        p = p -> n;
    }
}
 
int abs(int n) { return n > 0 ? n : -n; }
 
int min(int a, int b) {
    return abs(a) > abs(b) ? abs(b) : abs(a);
}
 
int main() {
    scanf("%d", &n);
    List list;
    list.insert(-1);
    for(int i = 0; i < n; i++) {
        int tmp; scanf("%d", &tmp);
        list.insert(tmp);
    }
    sort(n + 1);
 
    List seq;
    for(int i = 1; i <= n; i++) {
        seq.insert(arr[i]);
    }
 
    Node *p = list.head -> n;
    for(int i = 0; i < n - 1; ++i) {
        if(p -> prev == nullptr) {
            p -> diff = abs(p -> next -> val - p -> val);
        } else if(p -> next == nullptr) {
            p -> diff = abs(p -> prev -> val - p -> val);
        } else {
            p -> diff = min(p -> prev -> val - p -> val, p -> next -> val - p -> val);
        }
        seq.remove(p);
        p = p -> n;
    }
 
    list.traverse();
    return 0;
}