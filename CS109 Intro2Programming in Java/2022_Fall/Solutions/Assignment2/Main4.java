import java.util.Arrays;
import java.util.Scanner;

public class Main4 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int str = 0, same = 0, cnt = 0; boolean pair = false, three = false;
        int rank[] = new int[5]; String pre_suit = new String();
        for(int i = 0; i < 5; i++) {
            String suit = input.next();
            if(suit.equals(pre_suit)) cnt++;
            pre_suit = suit;
            rank[i] = input.nextInt();
        }

        Arrays.sort(rank);

        int pre_rank = -1000;
        for(int i = 0;i < 5; i++) {
            if(pre_rank == rank[i]) {
                same++;
                pair = true;
                if(same >= 2) three = true;
            } else if(rank[i] == pre_rank + 1){
                str++;
                same = 0;
            } else {
                same = 0;
            }
            pre_rank = rank[i];
        }

        if(cnt == 4) {
            if(str == 4) {
                System.out.print("Straight Flush");
            } else { 
                System.out.print("Flush");
            }
        } else if(str == 4) {
           System.out.print("Straight");
        } else if(three) {
            System.out.print("Three of a Kind");
        } else if(pair) {
            System.out.print("Pair");
        } else {
            System.out.print("High Card");
        }
        input.close();
    }
}