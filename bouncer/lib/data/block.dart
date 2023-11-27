import 'package:flutter/material.dart';

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

  dynamic widget() {
    return Positioned(
      top: y,
      left: x,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: color,
        ),
      ),
    );
  }


}