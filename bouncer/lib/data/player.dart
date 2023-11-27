import 'package:flutter/material.dart';

class Player {
  double x;
  double y;
  final double width;
  final double height;

  Player({required this.x,required this.y, required this.width,required this.height});


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
