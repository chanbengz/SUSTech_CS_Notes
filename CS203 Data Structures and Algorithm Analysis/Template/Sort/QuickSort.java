public class QuickSort {
    public static void main(String[] args) {
        int[] test = {12, 43, 7, 2, 34, 25, 54};
        sort(test);
        for (int var : test) {
            System.out.print(var);
            System.out.print(" ");
        }
        System.out.println();
    }

    public static void sort(int[] arr) {
      sort(arr, 0, arr.length - 1);
    }

    private static void sort(int[] arr, int start, int end) {
        if (end <= start) {
          return;
        }
        // 切分
        int pivotIndex = partition(arr, start, end);
        sort(arr, start, pivotIndex - 1);
        sort(arr, pivotIndex + 1, end);
    }

    private static int partition(int[] arr, int start, int end) {
        int left = start;
        int right = end;
        int pivot = arr[start]; // 取第一个元素为基准值

        while (true) {
            while (arr[left] <= pivot) {
                left++;
                if (left == right) {
                    break;
                }
            }

            while (arr[right] > pivot) {
                right--;
                if (left == right) {
                    break;
                }
            }

            if (left >= right) {
                break;
            }

            int temp = arr[left];
            arr[left] = arr[right];
            arr[right] = temp;
        }

        int temp = arr[start];
        arr[start] = arr[right];
        arr[right] = temp;
        return right;
    }
}
