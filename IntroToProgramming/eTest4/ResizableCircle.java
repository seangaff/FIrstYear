package eTest4;

public class ResizableCircle extends Circle implements Resizable {

    ResizableCircle(double radius) {
        super(radius);
    }

    public void resize(int percent) {
        radius = radius * (percent/100);
    }
}
