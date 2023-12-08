#include<cstdio>
const int MAX = 1e5 + 5;
int n, k, arr[MAX];

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
        int find_kth(int k) { return find_kth(root, k); }
    private:
        Node *root;
        int size;

        int get_Height(Node *node) { return node ? node->height : 0; }
        int get_Balance_Factor(Node *node) { return node ? get_Height(node->left) - get_Height(node->right) : 0; }
        int get_node_size(Node *node) { return node ? node->size : 0; }
        Node* get_MinNode(Node* node) { return node->left ? get_MinNode(node->left) : node; }
        int max(int a, int b) { return a > b ? a : b; }
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

        int find_kth(Node* node, int k){
            if(node == nullptr || k < 1 || k > node->size) return 0;
            if(k < get_node_size(node->left) + 1)
                return find_kth(node->left, k);
            else if(k > get_node_size(node->left) + node->count)
                return find_kth(node->right, k - get_node_size(node->left) - node->count);
            return node->val;
        }
};

int main() {
    scanf("%d%d", &n, &k);
    for(int i = 0; i < n; i++) scanf("%d", &arr[i]);
    AVL tree;
    for(int i = 0; i < k; i++) tree.add(arr[i]);
    for(int i = 0; i < n - k + 1; i++) {
        int kth; scanf("%d", &kth);
        printf("%d\n", tree.find_kth(kth));
        tree.remove(arr[i]);
        if(i != n - k) tree.add(arr[k + i]);
    }
    return 0;
}