import java.util.Scanner;

public class NetherseaLand {
    static private int N, M;
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt(), m = input.nextInt(), k = input.nextInt();
        N = n; M = m;
        int x = 0,y = 0;
        char[][] map = new char[n + 5][m + 5];
        for(int i = 1; i <= n; i++){
            for(int j = 1; j <= m; j++) {
                char temp = input.next().charAt(0);
                if(temp == 'B') {x = i; y = j;}
                map[i][j] = temp;
            }
        }
        bfs(map, k, x, y);
        for(int i = 1; i <= n; i++){
            for(int j = 1; j <= m; j++) {
                System.out.printf("%c ", map[i][j]);
            }
            System.out.println();
        }
        input.close();
    }

    private static void bfs(char[][] map, int k, int x, int y) {
        if(k < 0) return;
        if(x <= 0 || x >= N + 1 || y <= 0 || y >= M + 1) return;
        map[x][y] = 'B';
        if(map[x+1][y] == 'L') bfs(map, k - 1, x + 1, y);
        if(map[x][y+1] == 'L') bfs(map, k - 1, x, y + 1);
        if(map[x-1][y] == 'L') bfs(map, k - 1, x - 1, y);
        if(map[x][y-1] == 'L') bfs(map, k - 1, x, y - 1);
    }
}

