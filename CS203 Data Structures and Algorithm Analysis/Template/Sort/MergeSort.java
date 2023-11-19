public class MergeSort {
    public static void main(String[] args) {
        int test[] = {28, 12, 51, 43, 1, 63, 32, 74};
        sort(test);
        for (int var : test) {
            System.out.print(var);
            System.out.print(" ");
        }
        System.out.println();
    }

    public static void sort(int arr[]) {
        int[] tempArr = new int[arr.length];
        sort(arr, tempArr, 0 , arr.length - 1);
    }

    private static void sort(int arr[], int tempArr[], int start, int end) {
        if(end <= start) {
            return;
        }
        // 中部下标
        int middle = start + (end - start) / 2;
        sort(arr, tempArr, start, middle);
        sort(arr, tempArr, middle + 1, end);

        // 归并
        merge(arr, tempArr, start, middle, end);
    }

    private static void merge(int arr[], int tempArr[], int start, int middle, int end) {
        for (int i = start; i <= end; i++) {
            tempArr[i] = arr[i];
        }

        int left = start;
        int right = middle + 1;
        for (int i = start; i <= end; i++) {
            if (left > middle) {
                arr[i] = tempArr[right++];
            } else if (right > end) {
                arr[i] = tempArr[left++];
            } else if (tempArr[right] < tempArr[left]) {
                arr[i] = tempArr[right++];
            } else {
                arr[i] = tempArr[left++];
            }
        }
    }
}
