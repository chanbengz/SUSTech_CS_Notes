/*
 *
 */

import java.io.*;
import java.util.Arrays;

public class Main {
    static class Reader {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        StreamTokenizer st = new StreamTokenizer(bf);

        public int nextInt() throws IOException {
            st.nextToken();
            return (int) st.nval;
        }

        public double nextDouble() throws IOException {
            st.nextToken();
            return st.nval;
        }

        public String nextLine() throws IOException {
            return bf.readLine();
        }
        public boolean hasNext() throws IOException {
            boolean b= st.nextToken() != StreamTokenizer.TT_EOF;
            st.pushBack();
            return b;
        }
    }
    static PrintWriter out = new PrintWriter(System.out);
    static Reader in = new Reader();

    public static void main(String[] args) throws IOException {
        while(in.hasNext()) {
            int L = in.nextInt(), n = in.nextInt(), m = in.nextInt(), mt = m - 1, nt = n + 1;
            int[] ns = new int[nt + 1];
            for (int i = 1; i < nt; i++) {
                ns[i] = in.nextInt();
            }
            ns[nt] = L;
            Arrays.sort(ns);
            int left = 1, right = L + 1, mid, k = Math.min(mt, n);
            while (left < right) {
                mid = (left + right) / 2;
                int v = minE(ns, mid);
                if (v <= k) right = mid;
                else left = mid + 1;
            }
            out.println(right);
            out.flush();
        }
    }
    public static int minE(int[] ns, int lim){
        int count=0,s=0;
        for (int i = 1; i < ns.length; i++) {
            if(ns[i]-ns[s]>lim){
                if(s==--i) return Integer.MAX_VALUE;
                s=i;
                count++;
            }
        }
        return count;
    }
}