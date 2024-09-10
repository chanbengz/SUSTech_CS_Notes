import java.util.EnumSet;
import java.util.Scanner;

enum PhoneModel {
    IPHONE("iOS"),
    HUAWEI("Android"),
    PIXEL("Android"),
    SAMSUNG("Android"),
    LG("Android");

    private final String os;

    private PhoneModel(String os) {
        this.os = os;
    }

    public String getOS() {
        return this.os;
    }
}

public class LAB11E1 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.print("Prefered System: ");
        String preos = input.next();
        if (preos.equalsIgnoreCase("ios")) {
            PhoneModel phone = PhoneModel.IPHONE;
            System.out.printf("%-16s%-10s\n", phone, phone.getOS());
        } else if(preos.equalsIgnoreCase("android")) {
            for(PhoneModel phone : EnumSet.range(PhoneModel.HUAWEI, PhoneModel.LG)) {
                System.out.printf("%-16s%-10s\n", phone, phone.getOS());
            }
        } else {
            System.out.println("No Recommandations");
        }
        input.close();
    }
}