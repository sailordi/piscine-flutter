class Circle {
  double x = 0.0;
  double y = 0.0;
  double radius = 0.0;

  Circle(double x,double y, double radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
  }

  double area() { return 3.14*radius*radius; }

  double perimeter() { return 2*3.14*radius; }

  double rightMostCoordinate() { return x+ radius; }
  
  double leftMostCoordinate() { return x - radius; }
  
  double highestCoordinate() { return y + radius; }
  
  double lowestCoordinate() { return y - radius; }

}

void main() {
  var circle = Circle(0.0,0.0,5.0);

  // Using getters
  print('Area: ${circle.area()}');
  print('Perimeter: ${circle.perimeter()}');
  print('Rightmost Coordinate: ${circle.rightMostCoordinate()}');
  print('Leftmost Coordinate: ${circle.leftMostCoordinate()}');
  print('Highest Coordinate: ${circle.highestCoordinate()}');
  print('Lowest Coordinate: ${circle.lowestCoordinate()}');

}