public class UrarasDivination {
    private static int[] step1(int p, int v, int[] x) {
        int[] w = new int[]{ v, Judge.query(p+1, p+2, p+3), Judge.query(p+2, p+3, p+4), 1 - v };
        for (int j = 0; j < 3; j++)
            if (w[j] != w[j+1]) {
                x[p + j] = w[j];
                x[p + j + 3] = w[j+1];
                x[p + j + 1] = Judge.query(p + j, p + j + 3, p + j + 1);
                x[p + j + 2] = 1 - x[p + j + 1];

                for (int k = p; k < p + 6; k++)
                    if (k < p + j || k > p + j + 3)
                        x[k] = Judge.query(p + j, p + j + 3, k);

                if (w[j] == 1)
                    return new int[]{ p + j + 3, p + j };
                else
                    return new int[]{ p + j, p + j + 3 };
            }

        throw new RuntimeException("unreachable");
    }

    public static int[] solve(int n) {
        int[] x = new int[n];

        int[] a = new int[n / 3];
        for (int i = 0; i < n; i += 3)
            a[i / 3] = Judge.query(i, i+1, i+2);

        int[] y = null;
        for (int i = 0; i < n / 3 - 1; i++)
            if (a[i] != a[i + 1]) {
                y = step1(i * 3, a[i], x);
                a[i] = a[i + 1] = -1;
                break;
            }

        for (int i = 0; i < n / 3; i++)
            if (a[i] != -1) {
                int j = i * 3;
                int v = Judge.query(j, j + 1, y[ 1 - a[i] ]);

                if (v != a[i]) {
                    x[j + 2] = a[i];
                    x[j] = Judge.query(y[0], y[1], j);
                    x[j + 1] = 1 - x[j];
                }
                else {
                    x[j] = x[j + 1] = v;
                    x[j + 2] = Judge.query(y[0], y[1], j + 2);
                }
            }

        return x;
    }

    public static void main(String[] args) {
        Judge.main(args);
    }
}

class Judge {
    private static int n;
    private static int[] x;
    private static int count = 0;

    public static int query(int a, int b, int c) {
        // check duplicated indices
        if (a == b || b == c || a == c) {
            System.err.printf("[!] Duplicated indices: %d %d %d\n", a, b, c);
            System.exit(1);
        }
        // check out-of-bound
        if (a >= n || b >= n || c >= n || a < 0 || b < 0 || c < 0) {
            System.err.printf("[!] Indices out of range: %d %d %d\n", a, b, c);
            System.exit(1);
        }

        count++;  // increase the guessing times

        int sum = x[a] + x[b] + x[c];  // count the number of 1s
        System.out.printf("[+] Query %d %d %d => %d\n", a, b, c, sum / 2);
        return sum / 2;  // if there are two or more 1s, it will return 1
    }

    public static void main(String[] args) {
        java.util.Scanner scanner = new java.util.Scanner(System.in);

        System.out.print("[*] n: ");
        n = scanner.nextInt();

        // read an array x[]
        System.out.print("[*] x[]: ");
        x = new int[n];
        for (int i = 0; i < n; i++)
            x[i] = scanner.nextInt();

        // call your code
        int[] y = Main.solve(n);

        // compare your answer with the correct array
        boolean correct = true;
        for (int i = 0; i < n; i++)
            if (x[i] != y[i])
                correct = false;

        System.out.println();
        System.out.println(correct ? "[+] Correct" : "[-] Wrong");
        System.out.println("[+] Number of guesses: " + count);
        System.out.println("[+] Your answer: " + java.util.Arrays.toString(y));
        System.out.println("[+]   The array: " + java.util.Arrays.toString(x));
    }
}