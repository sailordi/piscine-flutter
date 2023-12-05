import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

enum Direction { up, down, left, right }

class Ball {
  double x;
  double y;
  double speedX;
  double speedY;
  Direction xDir = Direction.left;
  Direction yDir = Direction.down;

  Ball(
      {required this.x,
        required this.y,
        required this.speedX,
        required this.speedY
      });

  void move() {
    if (xDir== Direction.left) {
      x -= speedX;
    } else if (xDir == Direction.right) {
      x += speedX;
    }
    // move vertically
    if (yDir == Direction.down) {
      y += speedY;
    } else if (yDir == Direction.up) {
      y -= speedY;
    }
  }

  (double,double) pos() {
    return (x,y);
  }

  Rect rect() {
    return Rect.fromLTRB(x,y,x + Ball.diameter(),y + Ball.diameter() );
  }

  void updateDir(BuildContext context,bool playerCollision) {
    // Check collision with left and right walls
    if (x - 10 <= 0) {
      xDir = Direction.right;
    }
    else if(x + 10 >= MediaQuery.of(context).size.width) {
      xDir = Direction.left;
    }
    // Check collision with top wall
    if (y - 10 <= 0) {
      yDir = Direction.down;
    }
    // ball goes up when it hits player
    if (playerCollision) {
      yDir = Direction.up;
    }

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