package eTest4;

public class TestResizableCircle {

    public static void main(String[] args) {
        ResizableCircle newResizedCircle = new ResizableCircle(100);
        newResizedCircle.resize(200);
        System.out.printf("\nPerimeter of the resized Circle is %.2f",newResizedCircle.getPerimeter());
        System.out.printf("\nArea of the resized Circle is %.2f",newResizedCircle.getArea());
    }
}
