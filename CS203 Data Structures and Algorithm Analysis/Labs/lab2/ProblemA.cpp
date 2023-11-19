#include<cstdio>

int main() {
	int t; scanf("%d", &t);
	for(int y = 0; y < t; ++y) {
		int n, m;
		scanf("%d %d", &n, &m);
		int arr[m + n], left[n], right[m];
		for(int i = 0; i < n; ++i) scanf("%d", &left[i]);
		for(int i = 0; i < m; ++i) scanf("%d", &right[i]);

		int i = 0, j = 0, k = 0;
		while (i < n && j < m) { 
            if (left[i] < right[j]) 
                arr[k++] = left[i++]; 
            else if(left[i] > right[j])
                arr[k++] = right[j++]; 
            else {
            	arr[k++] = left[i++];
            	arr[k++] = right[j++];
            }
        }

        while (i < n) arr[k++] = left[i++]; 
    	while (j < m) arr[k++] = right[j++];

        for(int x = 0; x < n + m - 1; ++x) printf("%d ", arr[x]);
        printf("%d\n", arr[n + m - 1]);
	}
	return 0;
}