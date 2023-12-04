import 'package:flutter/material.dart';

const double bottomSpacing = 60;

class Player {
  double x;
  double y;
  final double width;
  final double height;

  static (double,double) startPosition(BuildContext context) {
    // Centered horizontally
    double x = MediaQuery.of(context).size.width / 2 - 40.0;
    double y = MediaQuery.of(context).size.height - bottomSpacing - 10.0; // Adjust 10.0 as needed

    return (x,y);
  }

  Player({required this.x,required this.y, required this.width,required this.height});

  bool collision((double,double) ballPos) {
    return ballPos.$2 + height >= y && ballPos.$1 >= x &&
        ballPos.$1 <= x + width &&
        ballPos.$2  <= y + height;
  }

  dynamic widget() {
    return Positioned(
      top: y,
      left: x,
      child: Container(
        width: width,
        height: height,
        color: Colors.red,
      ),
    );
  }
}
