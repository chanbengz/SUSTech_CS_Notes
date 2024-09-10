import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n = input.nextInt(); boolean flag = false;
        int[] a = new int[102]; int last = 0;
        for(int i = 1;i <=n ; i++){
            a[input.nextInt()]++;
        }
        for(int j = n; j>= 1; j--){
            if(a[j] == 0){
                last = j;
                break;
            }
        }
        for(int i = 1;i <=n ; i++){
            if(a[i] == 0) {
                System.out.printf("%d", i);
                if(i != last) System.out.printf(" ");
                flag = true;
            }
        }
        if(flag == false) System.out.printf("NULL");
        input.close();
    }
}
