#include<cstdio>
int n, cur;
long long ans;
int abs(int x) { return x > 0 ? x : -x; }
int min(int a, int b) { return a < b ? a : b; }

class Node {
    public:
        int val, height, size, count;
        Node *left, *right;
        Node(int val) {
            this->val = val;
            this->height = this->size = this->count = 1;
            this->left = this->right = nullptr;
        }
        void update() {
            size = (left ? left->size : 0) + (right ? right->size : 0) + count;
        }
};

class AVL {
    public:
        AVL() {
            root = nullptr;
            size = 0;
        }
        void add(int key) { root = add(root, key); }
        void remove(int key) { root = remove(root, key); }
        int find_prev(int key) { return find_prev(root, key); }
        int find_next(int key) { return find_next(root, key); }
        bool empty() { return size == 0; }
    private:
        Node *root;
        int size;
        int get_Height(Node *node) { return node ? node->height : 0; }
        int get_Balance_Factor(Node *node) { return node ? get_Height(node->left) - get_Height(node->right) : 0; }
        int get_node_size(Node *node) { return node ? node->size : 0; }
        Node* get_MinNode(Node* node) { return node->left ? get_MinNode(node->left) : node; }
        int max(int a, int b) { return a > b ? a : b; }
        int find_prev(Node* node, int key) {
            if(node == nullptr) return -1;
            if(node->val == key) {
                if(node->left == nullptr) return -1;
                Node* temp = node->left;
                while(temp->right) temp = temp->right;
                return temp->val;
            }
            if(node->val > key) return find_prev(node->left, key);
            int res = find_prev(node->right, key);
            if(res == -1) return node->val;
            return res;
        }
        int find_next(Node* node, int key) {
            if(node == nullptr) return -1;
            if(node->val == key) {
                if(node->right == nullptr) return -1;
                Node* temp = node->right;
                while(temp->left) temp = temp->left;
                return temp->val;
            }
            if(node->val < key) return find_next(node->right, key);
            int res = find_next(node->left, key);
            if(res == -1) return node->val;
            return res;
        }

        Node* rightRotate(Node* b){
            Node* a = b->left;
            Node* temp = a->right;
            a->right = b;
            b->left = temp;
            b->height = max(get_Height(b->left),get_Height(b->right))+1;
            a->height = max(get_Height(a->left),get_Height(a->right))+1;
            b->update();
            a->update();
            return a;
        }
        Node* leftRotate(Node* b){
            Node* a = b->right;
            Node* temp = a->left;
            a->left = b;
            b->right = temp;
            b->height = max(get_Height(b->left),get_Height(b->right))+1;
            a->height = max(get_Height(a->left),get_Height(a->right))+1;
            b->update();
            a->update();
            return a;
        }
        Node* add(Node *node, int key) {
            if(node == nullptr){
                size++;
                return new Node(key);
            }
            if(node->val == key){
                node->count++;
                node->update();
                return node;
            }
            if(node->val > key) node->left = add(node->left,key);
            else if(node->val < key) node->right = add(node->right,key);
            node->height = max(get_Height(node->left), get_Height(node->right)) + 1;
            node->update();
            int bf = get_Balance_Factor(node);
            if (bf >1 && get_Balance_Factor(node->left)>0) return rightRotate(node);
            if (bf <-1 && get_Balance_Factor(node->right)<0) return leftRotate(node);
            if (bf >1 && get_Balance_Factor(node->left)<0){
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
            if (bf <-1 && get_Balance_Factor(node->right)>0){
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
            return node;
        }

        Node* remove(Node* node, int key){
            if (node == nullptr){
                return nullptr;
            }
            Node* new_root = nullptr;
            if(node->val > key){
                node->left = remove(node->left,key);
                new_root = node;
            }else if(node->val < key){
                node->right = remove(node->right,key);
                new_root = node;
            }else{
                if(node->count > 1) {
                    node->count--;
                    node->update();
                    return node;
                }
                if(node->left == nullptr) {
                    Node* right = node->right;
                    node->right = nullptr;
                    size--;
                    new_root = right;
                }else if(node->right == nullptr) {
                    Node* left = node->left;
                    node->left = nullptr;
                    size--;
                    new_root = left;
                }else{
                    Node* minNode = get_MinNode(node->right);
                    minNode->right = remove(node->right,minNode->val);
                    minNode->left = node->left;
                    node->left = node->right = nullptr;
                    new_root = minNode;
                }
            }
            if(new_root == nullptr) return nullptr;
            new_root->height = max(get_Height(new_root->left), get_Height(new_root->right)) + 1;
            new_root->update();
            int bf = get_Balance_Factor(new_root);
            if(bf > 1 && get_Balance_Factor(new_root->left) >= 0) return rightRotate(new_root);
            if(bf < -1 && get_Balance_Factor(new_root->right) <= 0) return leftRotate(new_root);
            if(bf > 1 && get_Balance_Factor(new_root->left) < 0){
                new_root->left = leftRotate(new_root->left);
                return rightRotate(new_root);
            }
            if(bf < -1 && get_Balance_Factor(new_root->right) > 0){
                new_root->right = rightRotate(new_root->right);
                return leftRotate(new_root);
            }
            return new_root;
        }
};

int main() {
    scanf("%d", &n);
    AVL tree;
    for(int i = 0; i < n; i++) {
        int a, b; scanf("%d%d", &a, &b);
        if(tree.empty()) {
            cur = a;
            tree.add(b);
            continue;
        }

        if(a == cur) tree.add(b);
        else {
            int prev = tree.find_prev(b);
            int next = tree.find_next(b);
            if(prev == -1) {
                ans += abs(next - b);
                tree.remove(next);
            }
            else if(next == -1) {
                ans += abs(prev - b);
                tree.remove(prev);
            }
            else{
                if(abs(prev - b) <= abs(next - b)) {
                    ans += abs(prev - b);
                    tree.remove(prev);
                }
                else{
                    ans += abs(next - b);
                    tree.remove(next);
                }
            }
        }
    }
    printf("%lld\n", ans);
    return 0;
}