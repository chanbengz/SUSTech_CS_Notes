#include<cstdio>
#include<cstdlib>

class Node {
    public:
        int val;
        Node *next;
};

class List {
    public:
        Node *head;
        List();
        bool empty();
        int getLength();
        void insert(int val);
        void insert(int val, int pos);
        void remove(int &val);
        void remove(int &val, int pos);
        bool at(int &val, int pos);
        void traverse();
};

List::List() {
    this -> head = new Node;
    if(!(this -> head)) {
        printf("Error: Memory allocation failed.\n");
        exit(1);
    }
    this -> head -> val = -1;
    this -> head -> next = nullptr;
}

bool List::empty() {
    return this -> head -> next == nullptr;
}

int List::getLength() {
    int len = 0;
    Node *p = this -> head -> next;
    while(p) {
        len++;
        p = p -> next;
    }
    return len;
}

void List::insert(int val) {
    Node *p = new Node;
    if(!p) {
        printf("Error: Memory allocation failed.\n");
        exit(1);
    }
    p -> val = val;
    p -> next = this -> head -> next;
    this -> head -> next = p;
}

void List::insert(int val, int pos) {
    if(pos < 0 || pos > this -> getLength()) {
        printf("Error: Invalid position.\n");
        exit(1);
    }
    Node *p = this -> head;
    for(int i = 0; i < pos; i++) {
        p = p -> next;
    }
    Node *q = new Node;
    if(!q) {
        printf("Error: Memory allocation failed.\n");
        exit(1);
    }
    q -> val = val;
    q -> next = p -> next;
    p -> next = q;
}

void List::remove(int &val) {
    if(this -> empty()) {
        return ;
    }
    Node *p = this -> head -> next;
    this -> head -> next = p -> next;
    val = p -> val;
    delete p;
}

void List::remove(int &val, int pos) {
    if(pos < 0 || pos >= this -> getLength()) {
        printf("Error: Invalid position.\n");
        exit(1);
    }
    Node *p = this -> head;
    for(int i = 0; i < pos; i++) {
        p = p -> next;
    }
    Node *q = p -> next;
    p -> next = q -> next;
    val = q -> val;
    delete q;
}

bool List::at(int &val, int pos) {
    if(pos < 0 || pos >= this -> getLength()) {
        printf("Error: Invalid position.\n");
        exit(1);
    }
    Node *p = this -> head -> next;
    for(int i = 0; i < pos; i++) {
        p = p -> next;
    }
    val = p -> val;
    return true;
}

void List::traverse() {
    Node *p = this -> head -> next;
    while(p) {
        printf("%d ", p -> val);
        p = p -> next;
    }
    printf("\n");
}

int main() {
    List list;
    printf("List is empty: %d\n", list.empty());
    printf("List length: %d\n", list.getLength());
    list.insert(1);
    list.insert(2);
    list.insert(3);
    list.insert(4);
    list.insert(5);
    printf("List is empty: %d\n", list.empty());
    printf("List length: %d\n", list.getLength());
    list.traverse();
    int val;
    list.remove(val);
    printf("Removed value: %d\n", val);
    list.traverse();
    list.remove(val, 2);
    printf("Removed value: %d\n", val);
    list.traverse();
    list.at(val, 2);
    printf("Value at position 2: %d\n", val);
    return 0;
}
