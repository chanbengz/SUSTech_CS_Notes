public class SelectSort {
    public static void main(String[] args) {
        int[] test = {9, 29, 39, 2, 1, 53, 10};
        sort(test);
        for(int i : test) {
            System.out.print(i);
            System.out.print(" ");
        }
        System.out.println();
    }

    public static void sort(int arr[]) {
        for(int i = 0; i < arr.length; i++) {
            int min = i;
            for(int j = i + 1; j < arr.length; j++) {
                if(arr[j] < arr[min]) {
                    min = j;
                }
            }
            int temp = arr[i];
            arr[i] = arr[min];
            arr[min] = temp; // Swap arr[i] and arr[min]
        }
    }
}
