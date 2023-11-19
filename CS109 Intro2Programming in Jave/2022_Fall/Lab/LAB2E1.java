import java.util.Scanner;
public class LAB2E1 {
    public static void main(String[] args) {
        System.out.println("Welcome to S102A!");
        Scanner input = new Scanner(System.in);
        int A, B, sum;
        System.out.println("Enter the first integer: ");
        A = input.nextInt();
        System.out.println("Enter the second integer: ");
        B = input.nextInt();
        sum = A + B;
        input.close();
        System.out.printf("Sum is %d\n", sum);
    }
}
