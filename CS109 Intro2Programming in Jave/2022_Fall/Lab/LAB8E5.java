import java.util.Scanner;

public class LAB8E5 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("s1: ");
        String str1 = input.nextLine();
        System.out.print("s2: ");
        String str2 = input.nextLine();
        int cnt = 0, index = 0;
        do {
            index = str1.indexOf(str2,index);
            if(index < 0) break;
            System.out.printf("Found at index: %d\n", index);
            index++; cnt++;
        } while(true);
        System.out.printf("Total occurrences: %d\n", cnt);
        input.close();
    }
}