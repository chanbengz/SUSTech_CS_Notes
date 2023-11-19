import java.util.Scanner;
import java.util.Arrays;

public class HatsuneMiku {
    private static String[] removeArraysEmpty(String[] arr) {
        return Arrays.stream(arr).filter(s -> !"".equals(s)).toArray(String[]::new);
    }
    private static char[][] solve(String str, int n, int m) {
        int index = 0;
        char[][] a = new char[n][m];
        int r = n-1, c = -1, rbound = n - 2, cbound = m - 1, rbond = 0, cbond = 0;
        while(true) {
            do {
                a[r][++c] = str.charAt(index++);
                if(index == m*n) return a;
            }while(c < cbound);
            cbound--;

            do {
                a[--r][c] = str.charAt(index++);
                if(index == m*n) return a;
            }while(r > rbond);
            rbond++;

            do {
                a[r][--c] = str.charAt(index++);
                if(index == m*n) return a;
            }while(c > cbond);
            cbond++;

            do {
                a[++r][c] = str.charAt(index++);
                if(index == m*n) return a;
            }while(r < rbound);
            rbound--;
        }
    }
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt(), m = input.nextInt();
        String str = input.next();
        String[] strings = removeArraysEmpty(str.split("\\d"));
        String[] nums = removeArraysEmpty(str.split("[^0-9]"));
        int len = strings.length;
        String a = "";
        for(int i = 0; i < len; i++) {
            a += strings[i].repeat(Integer.parseInt(nums[i]));
        }
        char[][] ans = solve(a, n, m);
        for(int i = 0; i < n; i++) {
            for(int j = 0; j < m; j++) {
                System.out.print(ans[i][j]);
            }
            System.out.println();
        }
    }
}

