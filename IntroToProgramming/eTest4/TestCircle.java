package eTest4;

public class TestCircle {

    public static void main(String[] args) {
        Circle newCircle = new Circle(100);
        System.out.printf("\nPerimeter of the Circle is %.2f",newCircle.getPerimeter());
        System.out.printf("\nArea of the Circle is %.2f",newCircle.getArea());
    }
}
