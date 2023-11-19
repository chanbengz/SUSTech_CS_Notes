import java.util.Scanner;

public class LAB2E4 {
    public static void main(String[] args) {
        System.out.print("Enter the number of seconds: ");
        Scanner input = new Scanner(System.in);
        int sec, min, hr, x;
        x = input.nextInt();
        input.close();
        if (x < 0) {
            return;
        }
        hr = x / 3600; min = x % 3600 / 60; sec = x % 60;
        System.out.printf("The equivalent time is %d hours %d minutes and %d seconds.", hr, min, sec);
        
    }
}
