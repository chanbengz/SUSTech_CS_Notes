package Assignment3;
import java.util.Scanner;

public class Main5 {
    static int left_right(int[][] chessArray, int r, int c, int n) {
        int count = 1;
        int chessNum = chessArray[r][c];
        for (int i = c + 1; i <= n; i++) {
            if (chessNum == chessArray[r][i]) {
                count++;
            } else {
                break;
            }
        }
        for(int i = c - 1;i >= 1;i--){
            if(chessNum == chessArray[r][i]){
                count++;
            }else{
                break;
            }
        }
        return count;
    }

    static int up_down(int[][] chessArray, int r, int c, int n){
        int count = 1;
        int chessNum = chessArray[r][c];
        for(int i = r - 1; i>=1;i--){
            if(chessNum == chessArray[i][c]){
                count++;
            }else{
                break;
            }
        }
        for(int i = r + 1;i <= n; i++){
            if(chessNum == chessArray[i][c]){
                count++;
            }else{
                break;
            }
        }
        return count;
    }

    static int leftUp_RightDown(int[][] chessArray, int r, int c, int n){
        int count = 1;
        int chessNum = chessArray[r][c];
        for(int i = r + 1,j = c + 1;i <= n && j <= n; i++, j++){
            if(chessNum == chessArray[i][j]){
                count++;
            }else{
                break;
            }
        }
        for(int i = r-1,j = c-1;i>=1 && j>=1;i--,j--){
            if(chessNum == chessArray[i][j]){
                count++;
            }else{
                break;
            }
        }
        return count;
    }

    static int leftDown_RightUp(int[][] chessArray, int r, int c, int n){
        int count = 1;
        int chessNum = chessArray[r][c];
        for(int i = r + 1,j = c-1;i <= n && j >= 1;i++,j--){
            if(chessNum == chessArray[i][j]){
                count++;
            }else{
                break;
            }
        }
        for(int i = r - 1,j = c + 1;i >= 1 && j <= n;i--,j++){
            if(chessNum == chessArray[i][j]){
                count++;
            }else{
                break;
            }
        }
        return count;
    }

    static boolean isWin(int[][] a, int r, int c, int n){
        if(left_right (a, r, c, n) >= 5
                || up_down (a, r, c, n) >= 5
                || leftUp_RightDown(a, r, c, n) >= 5
                || leftDown_RightUp(a, r, c, n) >= 5
        ) return true;
        return false;
    }
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        boolean hasAns = false;

        int[][] a = new int[n+2][n+2];
        for(int i = 1; i <= n; i++) 
            for(int j = 1; j <= n; j++) a[i][j] = input.nextInt();
        
        for(int i = 1; i <= n; i++) {
            for(int j = 1; j <= n; j++){
                if( a[i][j] == 0 ){
                    a[i][j] = 1;
                    if(isWin(a, i, j, n)) {
                        System.out.printf("%d %d\n", i, j);
                        hasAns = true;
                    }
                    a[i][j] = 0;
                }
            }
        }
        if(hasAns == false) System.out.printf("-1\n");
        input.close();
    }
}
