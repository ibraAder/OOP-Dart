import 'dart:convert';
import 'dart:io';

// Interface for resizable shapes
abstract class Resizable {
  void resize(double factor);
}

// Parent class Shape
class Shape {
  String color;

  Shape(this.color);

  @override
  String toString() => 'Shape(color: $color)';
}

// Subclass Circle inheriting from Shape
class Circle extends Shape {
  double radius;

  Circle(String color, this.radius) : super(color);

  // Override toString method
  @override
  String toString() => 'Circle(color: $color, radius: $radius)';
}

// Subclass Rectangle inheriting from Shape and implementing Resizable interface
class Rectangle extends Shape implements Resizable {
  double width;
  double height;

  Rectangle(String color, this.width, this.height) : super(color);

  // Override toString method
  @override
  String toString() => 'Rectangle(color: $color, width: $width, height: $height)';

  // Method to resize the rectangle
  @override
  void resize(double factor) {
    width *= factor;
    height *= factor;
  }

  // Method demonstrating the use of a loop
  void calculatePerimeter() {
    double perimeter = 2 * (width + height);
    print('Perimeter of the rectangle: $perimeter');
  }
}

void main() {
  // Initialize instances of Circle and Rectangle from data in a JSON file
  String circleJson = '{"color": "red", "radius": 5}';
  String rectangleJson = '{"color": "blue", "width": 4, "height": 6}';

  Map<String, dynamic> circleData = jsonDecode(circleJson);
  Map<String, dynamic> rectangleData = jsonDecode(rectangleJson);

  Circle circle = Circle(circleData['color'], circleData['radius']);
  Rectangle rectangle = Rectangle(rectangleData['color'], rectangleData['width'], rectangleData['height']);

  // Override the toString method
  print(circle);
  print(rectangle);

  // Resize the rectangle
  rectangle.resize(1.5);
  print('Resized rectangle: $rectangle');

  // Calculate and print the perimeter of the rectangle using a loop
  rectangle.calculatePerimeter();
}
