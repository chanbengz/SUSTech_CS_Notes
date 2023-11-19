import java.util.Scanner;

public class MineSweeper {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        char[][] map = new char[n+3][n+3];
        for(int i = 1; i <= n; i++) {
            String temp = input.next();
            for(int j = 1; j <= n; j++) {
                map[i][j] = temp.charAt(j-1);
            }   
        }
        int x = input.nextInt() + 1, y = input.nextInt() + 1;
        if(map[x][y] == 'x') {
            System.out.println(-1);
        } else {
            int num = 0;
            for(int i = -1; i <= 1; i++) {
                for(int j = -1; j <= 1; j++) {
                    if(map[x+i][y+j] != 0 && map[x+i][y+j] == 'x') num++;
                }
            }
            System.out.println(num);
        }
        input.close();
    }
}
