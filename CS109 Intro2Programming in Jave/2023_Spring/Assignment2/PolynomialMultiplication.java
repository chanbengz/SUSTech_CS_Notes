import java.util.Scanner;

public class PolynomialMultiplication {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int T = input.nextInt();
        input.nextLine();
        for(int t = 0; t < T; t++) {
            int n = input.nextInt();
            int[] a = new int[n];
            for(int i = 0; i < n; i++) a[i] = input.nextInt();
            int m = input.nextInt();
            int[] b = new int[m];
            for(int i = 0; i < m; i++) b[i] = input.nextInt();

            int[] ans = new int[n + m - 1];
            for(int i = 0; i < n; i++) {
                for(int j = 0; j < m; j++) {
                    ans[i + j] += a[i] * b[j];
                }
            }
            for(int i = 0; i < ans.length; i++) System.out.printf("%d ", ans[i]);
            
            System.out.println();
        }
        input.close();
    }
}
