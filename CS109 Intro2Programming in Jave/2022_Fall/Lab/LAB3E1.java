public class LAB3E1 {
    public static void main(String[] args) {
        double score = Double.parseDouble(args[0]);
        double GPA = 0.0;
        if (score < 60) {
            System.out.println("You failed in the exam.");
            GPA = 0.0;
        } else if(score < 70) {
            GPA = 1.0;
        } else if(score < 80) {
            GPA = 2.0;
        } else if(score < 90) {
            GPA = 3.0;
        } else {
            GPA = 4.0;
        }

        if (GPA > 0.9) {
            System.out.println("You passed the exam.");
        }

        System.out.printf("Your score is %.1f, the GPA is %.1f\n", score, GPA);
    }
}