import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Ball {
  double x;
  double y;
  double speedX;
  double speedY;

  Ball(
      {required this.x,
        required this.y,
        required this.speedX,
        required this.speedY
      });

  void move() {
    x += speedX;
    y += speedY;
  }

  static double diameter() { return 20; }

  static (double,double) startPosition((double,double) playerPosition) {
    double x = playerPosition.$1 + Ball.diameter();
    double y = playerPosition.$2 - Ball.diameter();

    return (x,y);
  }

  dynamic widget() {
    return Positioned(
      top: y,
      left: x,
      child: Container(
        width: Ball.diameter(),
        height: Ball.diameter(),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      ),
    );

  }



}