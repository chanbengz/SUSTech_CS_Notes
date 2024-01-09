import java.io.*;
import java.util.*;
import java.math.BigInteger;
 
public class Main {
    public static void main(String[] args) {
        QReader in = new QReader();
        QWriter out = new QWriter();

        BigInteger four = new BigInteger("4");
        BigInteger two = new BigInteger("2");
        BigInteger six = new BigInteger("6");

        int t = in.nextInt();
        for(int i = 0; i < t; i++) {
            BigInteger n = new BigInteger(in.next());
            BigInteger a = n.multiply(n.add(BigInteger.ONE)).divide(two);
            BigInteger b = n.multiply(n.add(BigInteger.ONE)).multiply(n.multiply(two).add(BigInteger.ONE)).divide(six);
            BigInteger sum = a.add(b);
            sum = sum.divide(two);
            out.println(sum);
        }

        out.close();
    }
}
 
class QReader {
    private BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
    private StringTokenizer tokenizer = new StringTokenizer("");
 
    private String innerNextLine() {
        try {
            return reader.readLine();
        } catch (IOException e) {
            return null;
        }
    }
 
    public boolean hasNext() {
        while (!tokenizer.hasMoreTokens()) {
            String nextLine = innerNextLine();
            if (nextLine == null) {
                return false;
            }
            tokenizer = new StringTokenizer(nextLine);
        }
        return true;
    }
 
    public String nextLine() {
        tokenizer = new StringTokenizer("");
        return innerNextLine();
    }
 
    public String next() {
        hasNext();
        return tokenizer.nextToken();
    }
 
    public int nextInt() {
        return Integer.parseInt(next());
    }
 
    public long nextLong() {
        return Long.parseLong(next());
    }
}
 
class QWriter implements Closeable {
    private BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(System.out));
 
    public void print(Object object) {
        try {
            writer.write(object.toString());
        } catch (IOException e) {
            return;
        }
    }
 
    public void println(Object object) {
        try {
            writer.write(object.toString());
            writer.write("\n");
        } catch (IOException e) {
            return;
        }
    }
 
    @Override
    public void close() {
        try {
            writer.close();
        } catch (IOException e) {
            return;
        }
    }
}