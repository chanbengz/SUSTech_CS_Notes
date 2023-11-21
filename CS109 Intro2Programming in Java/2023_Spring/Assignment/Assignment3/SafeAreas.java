import java.util.Scanner;

public class SafeAreas {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        boolean[][] map = new boolean[n+200][n+200];
        int m = input.nextInt(), k = input.nextInt();
        int base = 52;
        for(int t = 0; t < m; t++) {
            int x = input.nextInt() + base, y = input.nextInt() + base;
            for(int i = x - 1; i <= x + 1; i++) {
                for(int j = y - 1; j <= y + 1; j++) {
                    map[i][j] = true;
                }
            }
        }

        for(int t = 0; t < k; t++) {
            int x = input.nextInt() + base, y = input.nextInt() + base;
            map[x][y] = true;
            int i = x - 2, j = y - 2;
            for(; i <= x + 2; i++) map[i][j] = true;
            i--;
            for(; j <= y + 2; j++) map[i][j] = true;
            j--;
            for(; i >= x - 2; i--) map[i][j] = true;
            i++;
            for(; j >= y - 2; j--) map[i][j] = true;
        }

        int num = 0;
        for(int i = 52; i < n + 52; i++) {
            for(int j = 52; j < n + 52; j++) {
                if(!map[i][j]) num++;
            }
        }
        System.out.println(num);
    }
}
