import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        QReader in = new QReader();
        QWriter out = new QWriter();
        int n = in.nextInt();
		int[] nums = new int[n];
		for(int i = 0; i < n; i++) {
			nums[i] = in.nextInt();;
		}
		sort(nums);
		int m = in.nextInt();
		for(int i = 0; i < m; i++) {
			int a = in.nextInt();
			boolean exist = binary(nums, a);
        	out.println(exist ? "yes" : "no");
    	}
    	out.close();
    }

    private static boolean binary(int[] nums, int key) {
    	int lo = 0; int hi = nums.length - 1;
		while(hi >= lo) {
			int mid = lo + (hi - lo) / 2;
			if (nums[mid] == key) return true;
			else if (nums[mid] < key) lo = mid + 1;
			else hi = mid - 1;
		}
		return false;
    }

    public static void sort(int[] arr) {
        int length = arr.length;
        buildHeap(arr, length);
        for (int i = length - 1; i > 0; i-- ) {
            int temp = arr[0];
            arr[0] = arr[i];
            arr[i] = temp;
            length--;
            sink(arr, 0, length);
        }
    }
    private static void buildHeap(int[] arr, int length) {
        for (int i = length / 2; i >= 0; i--) {
            sink(arr, i, length);
        }
    }

    private static void sink(int[] arr, int index, int length) {
        int leftChild = 2 * index + 1;
        int rightChild = 2 * index + 2;
        int present = index;

        if (leftChild < length && arr[leftChild] > arr[present]) {
            present = leftChild;
        }

        if (rightChild < length && arr[rightChild] > arr[present]) {
            present = rightChild;
        }

        if (present != index) {
            int temp = arr[index];
            arr[index] = arr[present];
            arr[present] = temp;
            sink(arr, present, length);
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

