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
        required this.speedY,
      });

  void move() {
    x += speedX;
    y += speedY;
  }

  dynamic widget() {
    return Positioned(
      top: y,
      left: x,
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      ),
    );

  }



}