package Assignment3;
import java.util.Scanner;

public class Main1 {
    static int[][] Transpose(int[][] a, int n) {
        for(int i = 0; i < n;i++) {
            for(int j = 0; j < n;j++) {
                if(i > j) continue;
                int t = a[i][j];
                a[i][j] = a[j][i];
                a[j][i] = t;
            }
        }
        return a;
    }
    static int[][] AddorSub(int[][] a, int[][] b,int n, int op) {
        for(int i = 0; i < n;i++) {
            for(int j = 0; j < n;j++) {
                a[i][j] += b[i][j]*op;
            }
        }
        return a;
    }
    static int[][] Multiply(int[][] a, int[][] b,int n) {
        int[][] result = new int[52][52];
        int c = 0;
        for(int i = 0; i < n; i++) {
            for(int j = 0;j < n; j++) {
                for(int k = 0; k < n; k++) {
                    c += a[i][k] * b[k][j];
                }
                result[i][j] = c;
                c = 0;
            }
        }
        return result;
    }

    public static void main(String[] args) {
        int[][] A1 = new int[52][52];
        int[][] A2 = new int[52][52];
        int[][] A3 = new int[52][52];
        int[][] A4 = new int[52][52];
        int[][] B1 = new int[52][52];
        int[][] B2 = new int[52][52];
        int[][] B3 = new int[52][52];
        int[][] B4 = new int[52][52];
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        for(int i = 0; i < n/2; i++) {
            for(int j = 0;j < n/2; j++) {
                A1[i][j] = input.nextInt();
            }
            for(int j = 0;j < n/2; j++) {
                A2[i][j] = input.nextInt();
            }
        }
        for(int i = 0; i < n/2; i++) {
            for(int j = 0;j < n/2; j++) {
                A3[i][j] = input.nextInt();
            }
            for(int j = 0;j < n/2; j++) {
                A4[i][j] = input.nextInt();
            }
        }
        for(int i = 0; i < n/2; i++) {
            for(int j = 0;j < n/2; j++) {
                B1[i][j] = input.nextInt();
            }
            for(int j = 0;j < n/2; j++) {
                B2[i][j] = input.nextInt();
            }
        }
        for(int i = 0; i < n/2; i++) {
            for(int j = 0;j < n/2; j++) {
                B3[i][j] = input.nextInt();
            }
            for(int j = 0;j < n/2; j++) {
                B4[i][j] = input.nextInt();
            }
        }
        int[][] res1 = new int[52][52];
        int[][] res2 = new int[52][52];
        int[][] res3 = new int[52][52];
        int[][] res4 = new int[52][52];
        res1 = AddorSub(A1, B1, n/2, 1);
        res2 = Multiply(A2, Transpose(B2,n/2), n/2);
        res3 = Multiply(B3, Transpose(A3,n/2), n/2);
        res4 = AddorSub(A4, B4, n/2, -1);

        for(int i = 0; i < n/2; i++) {
            for(int j = 0;j < n/2; j++){
                System.out.printf("%d ", res1[i][j]);
            }
            for(int j = 0;j < n/2; j++){
                System.out.printf("%d ", res2[i][j]);
            }
            System.out.println();
        }
        for(int i = 0; i < n/2; i++) {
            for(int j = 0;j < n/2; j++){
                System.out.printf("%d ", res3[i][j]);
            }
            for(int j = 0;j < n/2; j++){
                System.out.printf("%d ", res4[i][j]);
            }
            System.out.println();
        }
        input.close();
    }
}
