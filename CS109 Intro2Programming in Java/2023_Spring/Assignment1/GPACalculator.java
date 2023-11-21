import java.util.Scanner;

public class GPACalculator {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        double sum = 0;
        double credit = 0;
        for (int i = 0; i < n; i++) {
            int score = in.nextInt();
            double c = in.nextInt();
            credit += c;
            switch (score / 10) {
                case 9:
                case 10:
                    sum += 4 * c;
                    break;
                case 8:
                    sum += 3 * c;
                    break;
                case 7:
                    sum += 2 * c;
                    break;
                case 6:
                    sum += 1 * c;
                    break;
            }
        }
        System.out.printf("%.2f", sum / credit);
    }
}

