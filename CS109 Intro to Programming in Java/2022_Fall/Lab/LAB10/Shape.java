package Lab10;

public class Shape {
    private double x;
    private double y;
    private static int screenSize = 10;
    protected ShapeColor color = ShapeColor.GRAY;
    public Shape(double x, double y) {
        this.x = x;
        this.y = y;
    }
    public double getX() {
        return x;
    }
    public void setX(double x) {
        this.x = x;
    }
    public double getY() {
        return y;
    }
    public void setY(double y) {
        this.y = y;
    }
    public int getScreenSize() {
        return screenSize;
    }
    public static void setScreenSize(int screenSize) {
        Shape.screenSize = screenSize;
    }
    public String toString() {
        return " x=" + x + ", y=" + y + ", color=" + color;
    }
    public ShapeColor getColor() {
        return color;
    }
}
