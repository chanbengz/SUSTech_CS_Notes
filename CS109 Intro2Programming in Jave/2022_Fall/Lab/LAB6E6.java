import java.util.Scanner;

public class LAB6E6 {
    public static boolean check(int[][] board, int row, int column){
        if(board[row][column] == 0){
            if(board[row-1][column]==1&&board[row+1][column]==1&&board[row][column-1]==1&&board[row][column+1]==1){
                return true;
            }
            return false;
        }else{
            return false;
        }
    }
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int result = 0;
        int p = input.nextInt(), q = input.nextInt();
        int[][] a = new int[1000][1000];
        for(int i = 0;i < p; i++) {
            for(int j = 0;j < q;j++){
                a[i][j] = input.nextInt();
            }
        }
        for(int i = 1;i < p - 1; i++) {
            for(int j = 1;j < q - 1;j++){
                if(check(a, i, j)){
                    result++;
                }
            }
        }
        if(result <= 1){
            System.out.printf("There is %d bingo grid.\n", result);
        }else{
            System.out.printf("There are %d bingo grids.\n", result);
        }
        
        input.close();

    }
}