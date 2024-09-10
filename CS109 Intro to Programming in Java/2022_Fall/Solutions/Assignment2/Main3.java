import java.util.Scanner;

public class Main3 {
    private static int Smallest(int a[][]) {
        int min = 101, index = 0;
        for(int i = 0; i <= 3;i++){
            if(a[i][1] < min) {
                min = a[i][1];
                index = i;
            }
        }
        return index;
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int T = input.nextInt(), total = 0, days = 0;
        int a[][] = new int[4][2];
        for(int i = 0;i < T; i++) {
            total = 0; days = 0;
            for(int j = 0;j < 4;j++) {
                a[j][0] = input.nextInt();
                total += a[j][0];
            }
            for(int j = 0;j < 4;j++){
                a[j][1] = input.nextInt();
                if (a[j][0] == 30) a[j][1] = 102;
            }
                
            if (total >= 100) {
                System.out.println(0);
            }
            else {
                while (total < 100) {
                    int sml = Smallest(a);
                    days += a[sml][1]; a[sml][0]++ ; total++;
                    if(a[sml][0] >= 30) a[sml][1] = 102;
                }
                System.out.println(days);
            }
        }
        input.close();
    }
}
