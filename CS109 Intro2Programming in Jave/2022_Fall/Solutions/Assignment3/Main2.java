package Assignment3;
import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        int num = 0;
        int[][] a = new int[n+4][n+4];
        for(int i = 1; i <= n; i++)
            for(int j = 1; j <= n; j++)
                a[i][j] = input.nextInt();
        
        for(int i = 1; i <= n; i++)
            for(int j = 1; j <= n; j++)
                num += a[i][j]*(4 - (a[i-1][j] + a[i][j-1] + a[i][j+1] + a[i+1][j]));
        
        input.close();
        System.out.print(num);
    }
}
