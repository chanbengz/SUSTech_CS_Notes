#include<cstdio>

class Node {
    public:
        int val;
        Node *next;
        Node *prev;
};
Node* v[50005][2];
Node* q[50005];

class List {
    public:
        Node *head;
        Node *tail;
        List();
        void insert(int);
        void traverse();
};

List::List() {
    this -> head = nullptr;
    this -> tail = nullptr;
}

void List::insert(int val) {
    Node *p = new Node;
    p -> val = val;
    p -> next = nullptr;
    p -> prev = tail;
    if(this -> head == nullptr) this -> head = p;
    if(this -> tail) this -> tail -> next = p;
    this -> tail = p;
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
    int t; scanf("%d", &t);
    while(t--) {
        List list;
        int n; scanf("%d", &n);
        list.insert(-1);
        for(int i = 0; i < n; i++) {
            int tmp; scanf("%d", &tmp);
            list.insert(tmp);
        }
        Node* cursor = list.head -> next;

        int k = 1;
        while(cursor && cursor -> next){
            Node* iter = cursor -> next;
            if(iter && cursor -> val > iter -> val) {
                while(iter -> next && iter -> val > iter -> next -> val) iter = iter -> next;
                v[k][0] = cursor; v[k++][1] = iter;
                iter = iter -> next;
            }
            cursor = iter;
        }

        while (k != 1) {
            int j = 1;
            for(int i = 1; i < k; i++) {
                Node* start = v[i][0];
                Node* end = v[i][1];
                start -> prev -> next = end -> next;
                if(end -> next) end -> next -> prev = start -> prev;
                if(q[j - 1] != start -> prev) q[j++] = start -> prev;
            }

            k = 1;
            for(int i = 1; i < j; i++) {
                cursor = q[i];
                if(cursor -> val == -1) cursor = cursor -> next;
                if(cursor == nullptr) break;
                Node* iter = cursor -> next;
                if(iter && cursor -> val > iter -> val) {
                    while(iter -> next && iter -> val > iter -> next -> val) {
                        if (iter == q[i + 1]) i++;
                        iter = iter -> next;
                    }
                    v[k][0] = cursor; v[k++][1] = iter;
                }
            }
        }

        list.traverse();
    }
    return 0;
}