import java.util.Scanner;

public class RubicsCube {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < 9; j++) {
                if (j == 4) {
                    System.out.println(scanner.next());
                }
                else {
                    scanner.next();
                }
            }
        }
    }
}
