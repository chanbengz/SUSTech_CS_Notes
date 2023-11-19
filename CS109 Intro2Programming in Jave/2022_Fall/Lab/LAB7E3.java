import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Scanner;

class User {
    private String account;
    private String passwd;
    private double money;
    private static String getMD5String(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            return new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
           e.printStackTrace();
           return null;
        }
    }
    public void setUser(String name) {
        this.account = name;
    }
    public void setPassword(String pwd){
        this.passwd = getMD5String(pwd);
    }
    public void setMoney(double money){
        this.money = money;
    }
    private boolean checkPassword(String in){
        return getMD5String(in).equals(this.passwd);
    }
    public void introduce() {
        System.out.printf("%s's account has a balance of %.2f dollar\n", this.account, this.money);
    }
    public void expense(double value, Scanner in) {
        String input = in.next();
        if(checkPassword(input)){
            if(value <= this.money) {
                this.money -= value;
                System.out.printf("Expense %.2f dollar and balance %.2f dollar\n", value, this.money);
            } else {
                System.out.println("no sufficient funds");
            }
        } else {
            System.out.println("Invalid Password.");
        }
    }
}

class Food {
    private int id;
    private int size;
    private double prize;
    private String name;
    private String type;
    public void setFood(int id, String name, String type, int size, double prize){
        this.id = id; this.name = name; this.size = size; this.type = type; this.prize = prize;
    }
    public void getFood() {
        System.out.printf("[id] %d [type] %-10s [name] %-10s [size] %2d (Inches) %2.2f $\n", this.id, this.type, this.name, this.size, this.prize);
    }
    public double getPrize() {
        return this.prize;
    }
}

public class LAB7E3 {
    public static User generateUser(Scanner in){
        User usr = new User();
        System.out.print("Generate a user, please input name: ");
        usr.setUser(in.next());
        System.out.print("balance($): ");
        usr.setMoney(in.nextDouble());
        usr.setPassword("bobby4580");
        return usr;
    }

    public static ArrayList<Food> genarateMenu() {
        ArrayList<Food> foodlist = new ArrayList<Food>();
        Food a = new Food(), b = new Food(), c = new Food(), d = new Food();
        a.setFood(1, "pizza", "Seafood", 11, 12.00);
        b.setFood(2, "pizza", "Beef", 9, 10.00);
        c.setFood(3, "fried rice", "Seafood", 5, 12.00);
        d.setFood(4, "noodles", "Beef", 6, 14.00);
        foodlist.add(a); foodlist.add(b); foodlist.add(c); foodlist.add(d);
        return foodlist;
    }

    public static void userConsume(ArrayList<Food> foodlist, User user, Scanner input) {
        System.out.println("-------------------welcome,this is Start of the menu-------------------");
        for(Food i : foodlist) { i.getFood(); }
        System.out.println("-------------------welcome,this is  End  of the menu-------------------");
        System.out.println("please input the foodID and the number you want, to exit input 0 as foodID");
        int id = 0; double expense = 0.0;
        do {
            System.out.print("food id(input 0 to end select): ");
            id = input.nextInt();
            if(id > 0 && id < 5) {
                System.out.print("number of this food: ");
                int num = input.nextInt();
                if(num >= 0) {
                    expense += num * foodlist.get(id - 1).getPrize();
                } else {
                    System.out.println("Invalid number");
                }
            } else if(id < 0 || id > 4) {
                System.out.println("Invalid foodID");
            }
        } while (id != 0);
        System.out.println("select end");
        System.out.printf("Plan to expense %.2f dollar\n", expense);
        System.out.print("Please input your password: ");
        user.expense(expense, input);
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        ArrayList<Food> foodList = genarateMenu();  //generate a Menu
        User user = generateUser(input);
        user.introduce();
        userConsume(foodList,user,input);
        user.introduce();
        input.close();
    }
}