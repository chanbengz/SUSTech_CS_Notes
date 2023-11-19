import java.util.Scanner;

public class LAB5E5 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("How many numbers you will input: ");
        int n = input.nextInt();
        int a[] = new int[n];
        for (int i = 0; i < n; i++){
            a[i] = input.nextInt();
        }
        
        for (int j = 0; j < n; j++) {
            for (int i = 0; i < n; i++) {
                if(a[j] < a[i]) {
                    int temp = a[j];
                    a[j] = a[i];
                    a[i] = temp;
                }
            }
        }

        for(int e:a)
            System.out.printf("%d ", e);

        input.close();
    }
}