package Lab10;

public class Rectangle extends Shape {
    private double width;
    private double height;
    public Rectangle(double x, double y, double width, double height) {
        super(x, y);
        this.width = width;
        this.height = height;
    }
    public boolean isInBoundary() {
        if (-1 * this.getScreenSize() > this.getX() - this.width / 2 || this.getScreenSize() < this.getX()
                + this.width / 2) {
            return false;
        } if (-1 * this.getScreenSize() > this.getY() - this.height / 2 || this.getScreenSize() < this.getY()+ this.height / 2) {
            return false;
        }
        return true;
    }
    public double getWidth() {
        return width;
    }
    public void setWidth(double width) {
        this.width = width;
    }
    public double getHeight() {
        return height;
    }
    public void setHeight(double height) {
        this.height = height;
    }
    public void checkColor() {
        if (isInBoundary()) {
            color = ShapeColor.GREEN;
        } else {
            color = ShapeColor.RED;
        }
    }
    @Override
    public String toString() {
        return "Rectangle{" + "width=" + width + ", height=" + height + " x=" + this.getX() +
                ", y=" + this.getY() + ", color=" + this.getColor() + "}\n";
    }
    public void draw() {
        StdDraw.setPenColor(this.color.getColor());
        StdDraw.filledRectangle(this.getX(), this.getY(), this.width / 2, this.height / 2);
    }
}