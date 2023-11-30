import 'package:flutter/material.dart';

const double extraBottom = 1;
const double extraLeft = 1;

class Block {
  final double height;
  final double width;
  final double x;
  final double y;
  bool broken;
  final Color color;

  Block({required this.height,
    required this.width,
    required this.x,
    required this.y,
    this.broken = false,
    required this.color,
  });

  bool collision(double diameter,double x,double y) {
    return y - (diameter/2) <= this.y + height - extraBottom &&
      x >= this.x +extraLeft &&
      x <= this.x + width - extraLeft &&
      y >= this.y + extraBottom;
  }

  dynamic widget() {
    return Positioned(
      top: y + extraBottom,
      left: x + extraLeft,
      child: Container(
        width: width - (2 * extraLeft),
        height: height - (2 * extraBottom),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: color,
        ),
      ),
    );
  }


}