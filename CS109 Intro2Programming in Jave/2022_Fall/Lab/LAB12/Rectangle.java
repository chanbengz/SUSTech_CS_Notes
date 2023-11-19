package Lab12;

import java.awt.Color;

public class Rectangle extends Shape implements Comparable<Rectangle>, ColorDraw {

    private double width;//Rectangle 独有的属性
    private double height;//Rectangle 独有的属性
    /**
     * 子类继承父类，在构造方法里，首先要调用父类的构造方法
     * 父类Shape 只有一个构造方法 Shape(int x, int y),所以子类每个构造方法必须调用它
     * 父类用 super关键字表示
     * 子类继承父类时，创建子类的对象需要预留父类属性的空间，因此，子类对象包含 x,y,color以及width,height的存储空间
     *
     * @param x
     * @param y
     */
    public Rectangle(double x, double y) {
        super(x, y);// 第一步，调用父类的构造方法
    }
    public Rectangle(double x, double y, double width, double height) {
        super(x, y);
        this.width = width;
        this.height = height;
    }

    public void checkColor() {
        if (isInBoundary()) {
//            super.getColor() = ShapeColor.GREEN;
            super.setColor(ShapeColor.GREEN);
        } else {
            super.setColor(ShapeColor.RED);
        }
    }

    public boolean isInBoundary() {
        if (-1 * Shape.getScreenSize() > super.getX() - this.width / 2 || Shape.getScreenSize() < super.getX() + this.width / 2) {
            return false;
        }
        if (-1 * Shape.getScreenSize() > super.getY() - this.height / 2 || Shape.getScreenSize() < super.getY() + this.height / 2) {
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

    public String toString() {
        return "Rectangle{" +
                "width=" + width +
                ", height=" + height +
                super.toString() +
                "}\n";
    }

    public void draw() {
        //super: Shape class
        //super.getColor(): ShapeColor class
        //super.getColor().getColor():  Color class
        StdDraw.setPenColor(super.getColor().getColor());// color 用super.getColor() 替换
        StdDraw.filledRectangle(super.getX(), super.getY(), this.width / 2, this.height / 2);
    }
    @Override
    public void customizedColor(ColorScheme colorScheme, int index) {
        Color[] colorList = colorScheme.getColorScheme();
    if (index < 0) {
        index = 0; 
    }
    if (index >= colorList.length){
        index = index % colorList.length;
    }
        StdDraw.setPenColor(colorList[index]);
        StdDraw.filledRectangle(this.getX(), this.getY(), width/2, height/2);
    }
    @Override
    public int compareTo(Rectangle object) {
        int myarea = (int) (this.getHeight()*this.getWidth());
        int obarea = (int) (object.getHeight()*object.getWidth());
        if(myarea == obarea) {
            return this.getX() > object.getX() ? 1 : -1;
        }
        return myarea < obarea ? 1 : -1;
    }
}