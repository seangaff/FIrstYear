package eTest4;

import java.lang.Math;

public class Circle implements GeometricObject {
    public double radius = 1;
    Circle(double radius) {
        this.radius = radius;
    }
    public double getPerimeter() {
        return 2 * radius * Math.PI;
    }
    public double getArea() {
        return radius * radius * Math.PI;
    }
}
