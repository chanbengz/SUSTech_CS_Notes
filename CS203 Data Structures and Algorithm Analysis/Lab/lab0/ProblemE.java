import java.util.Scanner;
 
public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int t = in.nextInt();
        for(int i = 0; i < t; i++) {
            int x = in.nextInt(), y = in.nextInt(), z = in.nextInt();
            String[] cuboid = new String[z + y];
            for(int j = 0; j < z + y; j++) cuboid[j] = "";
            if (y <= z){
                for (int j = 0; j < y; j++) {
                    for (int k = 0; k < 2*y - 2*j; k++) {
                        cuboid[j] += ".";
                    }
                    for (int k = 0; k < x; k++) {
                        cuboid[j] += "+-";
                    }
                    cuboid[j] += "+";
                    for (int k = 0; k < j; k++) {
                        cuboid[j] += ".+";
                    }
                    cuboid[j] += "\n";
                    for (int k = 0; k < 2*y - 2*j - 1; k++) {
                        cuboid[j] += ".";
                    }
                    for (int k = 0; k < x; k++) {
                        cuboid[j] += "/.";
                    }
                    for (int k = 0; k < j + 1; k++) {
                        cuboid[j] += "/|";
                    }
                    cuboid[j] += "\n";
                }

                for (int j = 0; j < z - y; j++) {
                    for (int k = 0; k < x; k++) {
                        cuboid[j + y] += "+-";
                    }
                    cuboid[j + y] += "+";
                    for (int k = 0; k < y; k++) {
                        cuboid[j + y] += ".+";
                    }
                    cuboid[j + y] += "\n";
                    for (int k = 0; k < x; k++) {
                        cuboid[j + y] += "|.";
                    }
                    cuboid[j + y] += "|";
                    for (int k = 0; k < y; k++) {
                        cuboid[j + y] += "/|";
                    }
                    cuboid[j + y] += "\n";
                }
                for (int k = 0; k < x; k++) {
                    cuboid[z] += "+-";
                }
                cuboid[z] += "+";
                for (int k = 0; k < y; k++) {
                    cuboid[z] += ".+";
                }
                cuboid[z] += "\n";

                for (int j = 0; j < y; j++) {
                    for (int k = 0; k < x; k++) {
                        cuboid[z + j] += "|.";
                    }
                    for (int k = 0; k < y - j; k++) {
                        cuboid[z + j] += "|/";
                    }
                    for (int k = 0; k < 2*j + 1; k++) {
                        cuboid[z + j] += ".";
                    }
                    cuboid[z + j] += "\n";
                    for (int k = 0; k < x; k++) {
                        cuboid[z + j] += "+-";
                    }
                    for (int k = 0; k < y - j; k++) {
                        cuboid[z + j] += "+.";
                    }
                    for (int k = 0; k < 2*j + 1; k++) {
                        cuboid[z + j] += ".";
                    }
                    cuboid[z + j] += "\n";
                }
            } else {
                for (int j = 0; j < z; j++) {
                    for (int k = 0; k < 2*y - 2*j; k++) {
                        cuboid[j] += ".";
                    }
                    for (int k = 0; k < x; k++) {
                        cuboid[j] += "+-";
                    }
                    cuboid[j] += "+";
                    for (int k = 0; k < j; k++) {
                        cuboid[j] += ".+";
                    }
                    cuboid[j] += "\n";
                    for (int k = 0; k < 2*y - 2*j - 1; k++) {
                        cuboid[j] += ".";
                    }
                    for (int k = 0; k < x; k++) {
                        cuboid[j] += "/.";
                    }
                    for (int k = 0; k < j + 1; k++) {
                        cuboid[j] += "/|";
                    }
                    cuboid[j] += "\n";
                }

                for (int j = 0; j < y - z; j++) {
                    for (int k = 0; k < 2*y - 2*z - 2*j; k++) {
                        cuboid[j + z] += ".";
                    }
                    for (int k = 0; k < x; k++) {
                        cuboid[j + z] += "+-";
                    }
                    cuboid[j + z] += "+";
                    for (int k = 0; k < z; k++) {
                        cuboid[j + z] += ".+";
                    }
                    for (int k = 0; k < 2*j; k++) {
                        cuboid[j + z] += ".";
                    }
                    cuboid[j + z] += "\n";
                    for (int k = 0; k < 2*y - 2*z - 2*j - 1; k++) {
                        cuboid[j + z] += ".";
                    }
                    for (int k = 0; k < x; k++) {
                        cuboid[j + z] += "/.";
                    }
                    cuboid[j + z] += "/";
                    for (int k = 0; k < z; k++) {
                        cuboid[j + z] += "|/";
                    }
                    for (int k = 0; k < 2*j + 1; k++) {
                        cuboid[j + z] += ".";
                    }
                    cuboid[j + z] += "\n";
                }
                for (int k = 0; k < x; k++) {
                    cuboid[y] += "+-";
                }
                cuboid[y] += "+";
                for (int k = 0; k < z; k++) {
                    cuboid[y] += ".+";
                }
                for (int j = 0; j < 2*y - 2*z; j++) {
                    cuboid[y] += ".";
                }
                cuboid[y] += "\n";

                for (int j = 0; j < z; j++) {
                    for (int k = 0; k < x; k++) {
                        cuboid[j + y] += "|.";
                    }
                    for (int k = 0; k < z - j; k++) {
                        cuboid[j + y] += "|/";
                    }
                    for (int k = 0; k < 2*y - 2*z + 2*j + 1; k++) {
                        cuboid[j + y] += ".";
                    }
                    cuboid[j + y] += "\n";
                    for (int k = 0; k < x; k++) {
                        cuboid[j + y] += "+-";
                    }
                    for (int k = 0; k < z - j; k++) {
                        cuboid[j + y] += "+.";
                    }
                    for (int k = 0; k < 2*y - 2*z + 2*j + 1; k++) {
                        cuboid[j + y] += ".";
                    }
                    cuboid[j + y] += "\n";
                }
            }

            for(int j = 0; j < cuboid.length; j++) {
                System.out.print(cuboid[j]);
            }
        }
        in.close();
    }
}
