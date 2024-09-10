import java.util.Scanner;

public class LAB4E5 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int mul = 0;
        do {
            System.out.println("Please input a number to print the Multiplication Table [0 to terminate]:");
            mul = input.nextInt();
            if (mul < 0 || mul > 9) {
                System.out.println("Please input a number between [1,9]");
            } else {
                for (int i = 1; i <= mul; i++) {
                    for (int j = 1; j<= i; j++) {
                        System.out.printf("%d * %d = %2d  ", j, i, i*j);
                    }
                    System.out.print("\n");
                }
            }
        } while(mul != 0);
        input.close();
    }
}