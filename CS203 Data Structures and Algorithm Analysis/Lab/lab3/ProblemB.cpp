#include<cstdio>
#include<cstdlib>
char s[100005];
 
class Node {
    public:
        int val;
        Node *next;
        Node *prev;
};
 
class List {
    public:
        Node *head;
        Node *cursor;
        Node *tail;
        List();
        void insert(int val);
        void left();
        void right();
        void remove();
        void traverse();
};
 
List::List() {
    Node *p = new Node;
    p -> val = -1;
    p -> prev = nullptr;
    p -> next = nullptr;
    this -> head = p;
    this -> tail = p;
    this -> cursor = p;
}
 
void List::insert(int val) {
    Node *p = new Node;
    p -> val = val;
    p -> next = this -> cursor;
    if (cursor == head) {
        this -> head = p;
        p -> prev = nullptr;
    } else {
        p -> prev = this -> cursor -> prev;
        this -> cursor -> prev -> next = p;
    }
    this -> cursor -> prev = p;
}
 
void List::left() {
    if(cursor -> prev) this -> cursor = cursor -> prev;
}
 
void List::right() {
    if(cursor -> next) this -> cursor = cursor -> next;
}
 
void List::remove() {
    if(this -> cursor -> val == -1) return;
    Node *p = this -> cursor;
    if(p == this -> head) {
        this -> head = this -> head -> next;
        this -> head -> prev = nullptr;
    } else {
        p -> prev -> next = p -> next;
        if(p -> next) p -> next -> prev = p -> prev;
    }
    right();
    delete p;
}
 
void List::traverse() {
    Node *p = this -> head;
    while(p) {
        if(p -> val != -1) printf("%c", p -> val);
        p = p -> next;
    }
    printf("\n");
}
 
int main() {
    int T; scanf("%d", &T);
    for(int t = 0; t < T; t++) {
        List list;
        int n; scanf("%d", &n);
        scanf("%s", s);
        for(int i = 0; i < n; i++) {
            // list.traverse();
            switch (s[i]) {
                case 'r':
                    if(i < n - 1) {
                        if (list.cursor->val == -1) {
                            list.insert(s[++i]);
                            list.left();
                        } else list.cursor -> val = s[++i];
                    }
                    break;
                case 'I':
                    list.cursor = list.head;
                    break;
                case 'H':
                    list.left();
                    break;
                case 'L':
                    list.right();
                    break;
                case 'x':
                    list.remove();
                    break;
                default:
                    list.insert(s[i]);
                    break;
            }
        }
        list.traverse();
    }
    return 0;
}
