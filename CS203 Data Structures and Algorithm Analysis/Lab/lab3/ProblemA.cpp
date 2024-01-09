#include<cstdio>
#include<cstdlib>

class Node {
    public:
        int coefficient;
        int index;
        Node *next;
};

class List {
    public:
        Node *head;
        Node *tail;
        List();
        bool empty();
        int getLength();
        void insert(int coef, int ind);
        void traverse();
};

List::List() {
    this -> head = nullptr;
    this -> tail = nullptr;
}

bool List::empty() {
    return this -> head == nullptr;
}

int List::getLength() {
    int len = 0;
    Node *p = this -> head;
    while(p) {
        len++;
        p = p -> next;
    }
    return len;
}

void List::insert(int coef, int ind) {
    Node *p = new Node;
    p -> coefficient = coef;
    p -> index = ind;
    p -> next = nullptr;
    if(this -> empty()) this -> head = p;
    if(this -> tail) this -> tail -> next = p;
    this -> tail = p;
}

void List::traverse() {
    Node *p = this -> head;
    printf("%d\n", getLength());
    while(p) {
        printf("%d %d\n", p -> coefficient, p -> index);
        p = p -> next;
    }
}

List add(List a, List b) {
    List ans;
    Node *p = a.head, *q = b.head;
    while(p && q) {
        if(p -> index == q -> index) {
            ans.insert(p -> coefficient + q -> coefficient, p -> index);
            p = p -> next;
            q = q -> next;
        } else if(p -> index > q -> index) {
            ans.insert(p -> coefficient, p -> index);
            p = p -> next;
        } else {
            ans.insert(q -> coefficient, q -> index);
            q = q -> next;
        }
    }
    
    while(q) {
        ans.insert(q -> coefficient, q -> index);
        q = q -> next;
    }

    while(p) {
        ans.insert(p -> coefficient, p -> index);
        p = p -> next;
    }

    return ans;
}

int main() {
    List list1, list2;
    int n,m; scanf("%d%d",&n,&m);
    for(int i = 0; i < n; i++) {
        int coef, ind; scanf("%d%d",&coef,&ind);
        list1.insert(coef, ind);
    }
    for(int i = 0; i < m; i++) {
        int coef, ind; scanf("%d%d",&coef,&ind);
        list2.insert(coef, ind);
    }
    List ans = add(list1, list2);
    ans.traverse();
    return 0;
}
