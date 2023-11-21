package Assignment3;
import java.util.Scanner;

public class Main4 {
    static int[][] func(Scanner input, int m, int n){
        int r = 0, c = 0, rbound = m, cbound = n, rbond = 0, cbond = 1;
        int[][] a = new int[m+2][n+2];
        int index = 0;
        while(true) {
            do {
                a[r++][c] = input.nextInt();
                index++;
                if(index == m*n) return a;
            }while(r < rbound);
            rbound--;r--;c++;
            do {
                a[r][c++] = input.nextInt();
                index++;
                if(index == m*n) return a;
            }while(c < cbound);
            cbound--;c--;r--;
            do {
                a[r--][c] = input.nextInt();
                index++;
                if(index == m*n) return a;
            }while(r >= rbond);
            rbond++;r++;c--;
            do {
                a[r][c--] = input.nextInt();
                index++;
                if(index == m*n) return a;
            }while(c >= cbond);
            cbond++;c++;r++;
        }
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int m = input.nextInt(), n = input.nextInt();
        int[][] a = func(input,m,n);
        for(int i = 0; i < m; i++){
            for(int j = 0;j < n; j++){
                System.out.printf("%d ", a[i][j]);
            }
            System.out.println();
        }
        input.close();
    }
}
