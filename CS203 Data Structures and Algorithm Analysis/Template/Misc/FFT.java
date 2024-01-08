import java.util.Scanner;

public class Main {
    public static int[] readArray(Scanner scanner) {
        int n = scanner.nextInt();
        int[] x = new int[n];
        for (int i = n - 1; i >= 0; i--)
            x[i] = scanner.nextInt();
        return x;
    }

    public static void fftTransform(Complex[] a, int n, int k, Complex[] omega) {
        for (int i = 0; i < n; i++) {
            int t = 0;
            for (int j = 0; j < k; j++)
                if ((i & (1 << j)) > 0)
                    t |= (1 << (k - j - 1));
            if (i < t) {
                Complex tmp = a[i];
                a[i] = a[t];
                a[t] = tmp;
            }
        }

        for (int j = 2; j <= n; j *= 2) {
            int m = j / 2;
            for (int p = 0; p < n; p += j) {
                for (int i = 0; i < m; i++) {
                    Complex t = omega[n / j * i].multiply(a[p + m + i]);
                    a[p + m + i] = a[p + i].minus(t);
                    a[p + i] = a[p + i].add(t);
                }
            }
        }
    }

    public static int[] multiply(int[] x, int[] y) {
        int k = 0;
        while ((1 << k) < x.length + y.length)
            k++;
        int n = 1 << k;

        Complex[] omega = new Complex[n];
        Complex[] omegaInv = new Complex[n];
        for (int i = 0; i < n; i++) {
            omega[i] = Complex.omega(n, i);
            omegaInv[i] = omega[i].conj();
        }

        Complex[] c1 = new Complex[n];
        Complex[] c2 = new Complex[n];
        for (int i = 0; i < n; i++)
            c1[i] = i < x.length ? new Complex(x[i], .0) : Complex.ZERO;
        for (int i = 0; i < n; i++)
            c2[i] = i < y.length ? new Complex(y[i], .0) : Complex.ZERO;

        fftTransform(c1, n, k, omega);
        fftTransform(c2, n, k, omega);

        for (int i = 0; i < n; i++)
            c1[i] = c1[i].multiply(c2[i]);

        fftTransform(c1, n, k, omegaInv);

        int[] z = new int[ x.length + y.length - 1 ];
        for (int i = 0; i < z.length; i++)
            z[i] = (int)Math.floor(c1[i].real / n + 0.5);
        return z;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int t = scanner.nextInt();
        while (t-- > 0) {
            int[] x = readArray(scanner);
            int[] y = readArray(scanner);

            int[] z = multiply(x, y);
            for (int i = z.length - 1; i >= 0; i--)
                System.out.print(z[i] + " ");
            System.out.println();
        }
    }
}

class Complex {
    public static final Complex ZERO = new Complex(0, 0);

    double real, imag;

    public Complex(double real, double imag) {
        this.real = real;
        this.imag = imag;
    }

    public static Complex omega(int n, int i) {
        return new Complex(Math.cos(2 * Math.PI / n * i), Math.sin(2 * Math.PI / n * i));
    }

    public Complex conj() {
        return new Complex(this.real, -this.imag);
    }

    public Complex add(Complex other) {
        return new Complex(this.real + other.real, this.imag + other.imag);
    }

    public Complex minus(Complex other) {
        return new Complex(this.real - other.real, this.imag - other.imag);
    }

    public Complex multiply(Complex other) {
        return new Complex(
                this.real * other.real - this.imag * other.imag,
                this.real * other.imag + this.imag * other.real
        );
    }
}
