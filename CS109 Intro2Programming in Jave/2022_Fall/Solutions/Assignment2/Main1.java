import java.util.Scanner;

public class Main1 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        for(int cnt = 0; cnt < n; cnt++) {
            int[] a = new int[100]; int[] b = new int[100];
            int p = input.nextInt(), q = input.nextInt(), max = 0;
            if(p > q) max = p; else max = q;
            for(int i = p; i >= 1; i--){
                a[i] = input.nextInt();
            } 
            for(int j = q; j >= 1; j--){
                b[j] = input.nextInt();
            }
            for(int i = 1; i <= max; i++) {
                b[i] += a[i];
                if (b[i] > 9) {
                    b[i + 1]++;
                    b[i] -= 10;
                }
            }
            if(b[max+1] > 0) max++;
            for(int j = max; j >= 1; j--){
                System.out.printf("%d",b[j]);
            }
            System.out.println();
        }
        input.close();
    }
}