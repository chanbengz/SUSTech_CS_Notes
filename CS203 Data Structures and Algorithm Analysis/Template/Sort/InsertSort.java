public class InsertSort {
    public static void main(String[] args) {
        int[] test = {14, 23, 56, 2, 4, 10, 36};
        sort(test);
        for (int var : test) {
            System.out.print(var);
            System.out.print(" ");
        }
        System.out.println();
    }

    public static void sort(int arr[]) {
        for(int i = 1; i < arr.length; i++) {
            int cur = arr[i];
            int j = 0;
            for(j = i - 1; j >= 0; j--) {
                if (arr[j] > cur) {
                    arr[j + 1] = arr[j];
                } else {
                    break;
                }
            }
            arr[j + 1] = cur;
        }
    }
}
