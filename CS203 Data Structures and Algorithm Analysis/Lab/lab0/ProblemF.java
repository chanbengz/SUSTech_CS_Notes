import java.io.*;
import java.util.*;
 
public class ProblemF {
    static boolean isSuccess;

    public static void main(String[] args) {
        QReader in = new QReader();
        QWriter out = new QWriter();
        int n = in.nextInt();
        for(int i = 0; i < n; i++) {
            int cards[][] = new int[4][9];
            String str = in.next();
            isSuccess = false;
            for(int j = 0; j < 28; j += 2) {
                cards[num(str.charAt(j + 1))][str.charAt(j) - '1'] += 1;
            }
            dfs(cards, 14);
            if (isSuccess) out.println("Blessing of Heaven");
            else out.println("Bad luck");
        }

        out.close();
    }
    private static void dfs(int[][] cards, int cnt) {
        if(isSuccess) return;

        if(cnt == 2) { // quetou left
            ArrayList<int[]> quetou = search_quetou(cards);
            if (quetou.size() > 0) {
                isSuccess = true;
                return;
            }
        }

        ArrayList<int[]> kezi = search_kezi(cards);
        for (int[] i : kezi) {
            cards[i[0]][i[1]] -= 3;
            dfs(cards, cnt - 3);
            if (isSuccess) return;
            cards[i[0]][i[1]] += 3;
        }

        ArrayList<int[]> shunzi = search_shunzi(cards);
        for (int[] i : shunzi) {
            cards[i[0]][i[1]] -= 1;
            cards[i[0]][i[1] + 1] -= 1;
            cards[i[0]][i[1] + 2] -= 1;
            dfs(cards, cnt - 3);
            if (isSuccess) return;
            cards[i[0]][i[1]] += 1;
            cards[i[0]][i[1] + 1] += 1;
            cards[i[0]][i[1] + 2] += 1;
        }
    }

    private static ArrayList<int[]> search_kezi(int[][] cards) {
        ArrayList<int[]> arr = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 9; j++) {
                if (cards[i][j] >= 3) arr.add(new int[]{i, j});
            }
        }
        return arr;
    }

    private static ArrayList<int[]> search_shunzi(int[][] cards) {
        ArrayList<int[]> arr = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 7; j++) {
                if (cards[i][j] >= 1 && cards[i][j+1] >= 1 && cards[i][j+2] >= 1) arr.add(new int[]{i, j});
            }
        }
        return arr;
    }

    private static ArrayList<int[]> search_quetou(int[][] cards) {
        ArrayList<int[]> arr = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 9; j++) {
                if (cards[i][j] == 2) arr.add(new int[]{i, j});
            }
        }
        return arr;
    }

    private static int num(char c) {
        switch(c) {
            case 'w': return 0;
            case 'b': return 1;
            case 's': return 2;
            default: return 3;
        }
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
