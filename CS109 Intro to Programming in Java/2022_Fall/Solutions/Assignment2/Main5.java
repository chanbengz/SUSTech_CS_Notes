import java.util.Scanner;

public class Main5 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int N = input.nextInt();
        for(int i = 0; i < N; i++) {
            String hex = input.next();
            System.out.printf("%s ", hex.substring(6,8) + hex.substring(4,6) + hex.substring(2,4) + hex.substring(0,2));
        }
        input.close();
    }
}
