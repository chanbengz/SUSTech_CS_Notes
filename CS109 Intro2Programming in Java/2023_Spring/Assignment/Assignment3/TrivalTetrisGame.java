import java.util.Scanner;

public class TrivalTetrisGame {
    public static int[][] getIndexes(String type) {
        switch (type) {
            case "I":
                return new int[][] {
                        { 0, 0 },
                        { 0, 1 },
                        { 0, 2 },
                        { 0, 3 }
                };

            case "O":
                return new int[][] {
                        { 0, 0 },
                        { 0, 1 },
                        { 1, 0 },
                        { 1, 1 }
                };

            case "L":
                return new int[][] {
                        { 0, 0 },
                        { 1, 0 },
                        { 2, 0 },
                        { 2, 1 }
                };

            case "J":
                return new int[][] {
                        { 0, 1 },
                        { 1, 1 },
                        { 2, 1 },
                        { 2, 0 }
                };

            case "T":
                return new int[][] {
                        { 0, 0 },
                        { 0, 1 },
                        { 0, 2 },
                        { 1, 1 }
                };

            case "S":
                return new int[][] {
                        { 1, 0 },
                        { 1, 1 },
                        { 0, 1 },
                        { 0, 2 }
                };

            case "Z":
                return new int[][] {
                        { 0, 0 },
                        { 0, 1 },
                        { 1, 1 },
                        { 1, 2 }
                };
        
            default:
                throw new IllegalArgumentException("Invalid type: " + type);
        }
    }

    public static void printMatrix(int[][] mat) {
        for (int i = 2; i < mat.length; i++) {
            for (int j = 0; j < mat[i].length; j++) {
                System.out.print(mat[i][j]);
            }

            System.out.println();
        }

        System.exit(0);
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int w = in.nextInt(), h = in.nextInt(), n = in.nextInt();

        int[][] mat = new int[h + 2][w];

        for (int i = 0; i < n; i++) {
            String type = in.next();
            int y = in.nextInt();

            int[][] indexes = getIndexes(type);

            for (int j = 0; j < h + 2; j++) {
                boolean canPlace = true;

                for (int[] index : indexes) {
                    if (j + index[0] >= h + 2 || mat[j + index[0]][y + index[1]] == 1) {
                        canPlace = false;
                        break;
                    }
                }

                if (canPlace) {
                    if (j == h + 1) {
                        for (int[] index : indexes) {
                            mat[j + index[0]][y + index[1]] = 1;
                        }
                    }
                } else {
                    if (j == 0) {
                        printMatrix(mat);
                    }

                    for (int[] index : indexes) {
                        mat[j + index[0] - 1][y + index[1]] = 1;
                    }

                    break;
                }
            }

            for (int j = h + 1; j >= 1; j--) {
                int sum = 0;

                for (int k = 0; k < w; k++) {
                    sum += mat[j][k];
                }

                if (sum == w) {
                    for (int k = j; k >= 1; k--) {
                        for (int l = 0; l < w; l++) {
                            mat[k][l] = mat[k - 1][l];
                        }
                    }

                    for (int k = 0; k < w; k++) {
                        mat[0][k] = 0;
                    }
                    j++;
                }
            }

            for (int j = 0; j < w; j++) {
                if (mat[0][j] + mat[1][j] > 0) {
                    printMatrix(mat);
                }
            }
        }

        printMatrix(mat);
    }
}

