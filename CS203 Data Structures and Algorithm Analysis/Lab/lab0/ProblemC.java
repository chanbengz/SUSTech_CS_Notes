import java.util.Scanner;

public class ProblemC {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        in.nextLine();
        for(int t = 0; t < n; t++) {
            String[] str = in.nextLine().split(" ");
            int[] a = new int[str.length];
            for(int i = 0; i < str.length; i++) {
                a[i] = rank(str[i]);
            }
            sort(a);
            for(int i = 0; i < str.length; i++) {
                if(i == str.length - 1) System.out.println(name(a[i]));
                else System.out.print(name(a[i]) + " ");
            }
        }
        in.close();
    }

    private static int rank(String name) {
        if(name.length() == 2) {
            switch(name.charAt(0)) {
                case 'W':
                    return name.charAt(1) - '0';
                case 'T':
                    return 10 + (name.charAt(1) - '0');
                case 'Y':
                    return 20 + (name.charAt(1) - '0');
                default:
                    return -1;
            }
        }
        switch(name.charAt(0)) {
            case 'E':
                return 30;
            case 'S':
                return 31;
            case 'W':
                return 32;
            case 'N':
                return 33;
            case 'B':
                return 34;
            case 'F':
                return 35;
            case 'Z':
                return 36;
            default:
                return -1;
        }
    }

    private static String name(int rank) {
        String str = "WTYESWNBFZ";
        if(rank < 30) {
            return str.charAt(rank / 10) + String.format("%d", rank % 10);
        }
        return new String(new char[]{str.charAt(rank / 10 + rank % 10)});
    }

    public static void sort(int arr[]) {
        int n = arr.length;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
}