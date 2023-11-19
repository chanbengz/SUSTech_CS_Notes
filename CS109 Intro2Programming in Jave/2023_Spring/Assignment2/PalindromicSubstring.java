import java.util.Scanner;

public class PalindromicSubstring {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        for(int t = 0; t < n; t++) {
            String str = input.next();
            int len = str.length();
            int num = 0;
            for(int i = 0; i < len; i++) {
                for(int j = i + 1; j <= len; j++) {
                    if(isPalindrome(str.substring(i, j))) num++;
                }
            }
            System.out.println(num);
        }
        input.close();
    }

    private static boolean isPalindrome(String str) {
        char[] chars = str.toCharArray();
        int len = chars.length;
        for(int i = 0; i < len / 2; i++) {
            if(chars[i] != chars[len-i-1]) return false;
        }
        return true;
    }
}

