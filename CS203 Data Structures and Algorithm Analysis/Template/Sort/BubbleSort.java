public class BubbleSort {
    public static void main(String[] args) {
        int[] test = {51, 32, 76, 2, 25, 12, 49};
        sort(test);
        for (int var : test) {
            System.out.print(var);
            System.out.print(" ");
        }
        System.out.println();
    }

    public static void sort(int arr[]) {
        int n = arr.length;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
}
