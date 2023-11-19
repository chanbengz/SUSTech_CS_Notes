import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class LAB9E2 {
    public static void main(String[] args) {
        try {
            BufferedReader input = new BufferedReader(new FileReader("Test.in"));
            BufferedWriter output = new BufferedWriter(new FileWriter("Test.out"));
            int temp, fullstop = 1, capital = 0;
            while ((temp = input.read()) != -1) {
                if(temp >= 'A' && temp <= 'Z') {
                    capital = 1;
                } else if(capital == 1) {
                    if(temp != '.') capital = 0;
                } else if(temp == '.') {
                    fullstop = 1;
                }

                if( (temp >= 'a' && temp <= 'z')&&(fullstop == 1) ) {
                    output.write(temp - 'a' + 'A');
                    fullstop = 0;
                } else {
                    output.write(temp);
                }
            }
            input.close();
            output.close();
        } catch (IOException e) {
            System.err.println("File Invalid");
        }
    }
}