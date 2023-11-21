import java.util.Scanner;

public class ParticleMovement {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int T = input.nextInt();
        for (int i = 0; i < T; i++) {
            double expected = input.nextDouble();
            double mass =input.nextDouble();
            double charge = input.nextDouble();
            double voltage = input.nextDouble();
            double ratio = 2 * (charge / mass);
            expected = expected * expected;
            boolean reach = false;
            
            double v = ratio * voltage;
            if( v >= expected) reach = true;
            System.out.println(reach);
        }
    }
}
