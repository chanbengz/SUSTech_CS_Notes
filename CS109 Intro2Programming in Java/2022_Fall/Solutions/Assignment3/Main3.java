package Assignment3;
import java.util.Scanner;

public class Main3 {
    public static void main(String[] args) {
        double[] S = {0, 0.7853981634, 0.7853981634, 0.7853981634, 0.7853981634, 1.0, 0.9566114775, 0.9566114775, 0.9566114775, 0.9566114775};
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        int[][] a = new int[204][204];
        for(int p = 0;p < n; p++) {
            int op = input.nextInt();
            int x = input.nextInt() + 101, y = 101 - input.nextInt();
            if(op == 2) {
                a[y][x-1] = 5;
                a[y][x] = 5;
                a[y+1][x-1] = 5;
                a[y+1][x] = 5;
            } else {
                if (a[y][x-1] == 0||a[y][x-1] == 4) a[y][x-1] += 1;
                else if (a[y][x-1] == 2||a[y][x-1] == 6) a[y][x-1] = 6;
                else if (a[y][x-1] == 3||a[y][x-1] == 8) a[y][x-1] = 8;
                else if (a[y][x-1] == 7||a[y][x-1] == 9) a[y][x-1] = 5;

                if (a[y][x] == 0||a[y][x] == 3) a[y][x] += 2;
                else if (a[y][x] == 1||a[y][x] == 6) a[y][x] = 6;
                else if (a[y][x] == 4||a[y][x] == 9) a[y][x] = 9;
                else if (a[y][x] == 7||a[y][x] == 8) a[y][x] = 5;
                
                if (a[y+1][x-1] == 0||a[y+1][x-1] == 2) a[y+1][x-1] += 3;
                else if (a[y+1][x-1] == 4||a[y+1][x-1] == 7) a[y+1][x-1] = 7;
                else if (a[y+1][x-1] == 6||a[y+1][x-1]== 9) a[y+1][x-1] = 5;
                else if (a[y+1][x-1] == 1||a[y+1][x-1] == 8) a[y+1][x-1] = 8;

                if (a[y+1][x] == 0||a[y+1][x] == 1) a[y+1][x] += 4;
                else if (a[y+1][x] == 3||a[y+1][x] == 7) a[y+1][x] = 7;
                else if (a[y+1][x] == 6||a[y+1][x] == 8) a[y+1][x] = 5;
                else if (a[y+1][x] == 9||a[y+1][x] == 2) a[y+1][x] = 9;
            }
        }
        double area = 0;
        for(int i = 0;i < a.length; i++) {
            for(int j = 0; j < a[i].length; j++){
                area += S[a[i][j]];
            }
        }
        System.out.printf("%.5f\n", area);
        input.close();
    }
}
