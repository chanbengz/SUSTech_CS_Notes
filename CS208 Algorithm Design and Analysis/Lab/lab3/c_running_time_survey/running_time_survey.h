typedef long long ll;
typedef struct Task
{
    char task_name[50];
    ll (*function)(int);
    int upperBound;
    int type; // 0: Normal Test; 1: Exponential or FactorialTest Test
} Task;

ll linear_time(int n);
ll nlogn_time(int n);
ll quadratic_time(int n);
ll cubic_time(int n);
ll exponential_time(int n);
ll factorial_time(int n);
void merge_sort_up_to_down(int a[], int start, int end);
ll exponential_time_res(int *a, int n);
void factorial_time_res(int *a, int n);

void generate_array(int *array, int n);

