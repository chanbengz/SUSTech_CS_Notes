import java.util.Scanner;

public class Drawball {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int T = input.nextInt();
        int black = 1000;
        int white = 1000;
        int total = black + white;
        while (input.hasNextInt()) {
            int color = input.nextInt();
            if (color == 1) {
                black--;
                total--;
            } else {
                white--;
                total--;
            }
        }

        float pro = (float) (white) / (float) (total);
        System.out.printf("%.2f", pro);

    }
}

