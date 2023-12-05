import 'dart:math';
import 'package:flutter/material.dart';
import 'ball.dart';
import 'block.dart';
import 'player.dart';

const double ballSpeedX = 2,ballSpeedY = 2;
const numberOfBlockRows = 8;
const double blockWidth = 60,blockHeight = 20;

enum GameState{notStarted,playing,won,lost}

class Game{
  late GameState state;

  Game() {
    state = GameState.notStarted;
  }

  static Player initPlayer(BuildContext context) {
    (double,double) position = Player.startPosition(context);

    return Player(x: position.$1, y:position.$2, width: 80.0, height: 10.0);

  }

  static Ball initBall(BuildContext context) {
    (double,double) position = Ball.startPosition(Player.startPosition(context) );


    return Ball(x: position.$1, y: position.$2, speedX: ballSpeedX,speedY: ballSpeedY);
  }

  static Color _getRandomColor() {
    Random random = Random();
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);

    return Color.fromARGB(255, red, green, blue);
  }

  static List<Block> initBlocks(BuildContext context) {
    List<Block> ret = [];
    int blocksPerRow = (MediaQuery.of(context).size.width / blockWidth).floor();

    for(int row = 0; row < numberOfBlockRows; row++) {
      Color rowColor = _getRandomColor();
      for(int col = 0; col < blocksPerRow; col++) {
        double x = col * blockWidth;
        double y = row * blockHeight + 50.0;

        ret.add(Block(height: blockHeight,
            width: blockWidth,
            x: x,
            y: y,
            color: rowColor) );
      }

    }

    return ret;
  }

  void reset(BuildContext context,Ball ball,Player player,List<Block> blocks) {
    (double,double) playerPosition = Player.startPosition(context);
    (double,double) ballPosition = Ball.startPosition(playerPosition);

    ball.speedX = ballSpeedX;
    ball.speedY = ballSpeedY;
    ball.x = ballPosition.$1;
    ball.y = ballPosition.$2;
    ball.xDir = Direction.left;
    ball.yDir = Direction.down;

    player.x = playerPosition.$1;
    player.y = playerPosition.$2;

    for(Block b in blocks) {
      b.broken = false;
    }

    state = GameState.playing;
  }

  bool blockCollision(Ball ball,List<Block> blocks) {
    int active = blocks.length;

    for(Block block in blocks) {
      if(block.broken) {
        active--;
        continue;
      }

      Rect ballR = ball.rect();
      Rect blockR = block.rect();


      if(!ballR.intersect(blockR).isEmpty) {
        block.broken = true;

        //Ball hit left side
        if(ball.x+Ball.diameter()-1 <= blockR.left) {
          ball.xDir = Direction.right;
        }
        //Ball hit right side
        else if(ball.x+Ball.diameter()/2+1 >= blockR.right+blockR.width) {
          ball.xDir = Direction.right;
        }
        //Ball hits bottom
        else if(ball.y <= blockR.bottom) {
          ball.yDir = Direction.down;
        }
        //Ball hits top
        else if(ball.y + Ball.diameter()/2 >= blockR.bottom+blockR.height) {
          ball.yDir = Direction.up;
        }

        active--;
      }

    }

    if(active == 0){
      return true;
    }

    return false;

  }

  bool isDead(BuildContext context,(double,double) ballPos,double ballDiameter) {
    // Check collision with bottom
    if (ballPos.$2 + (ballDiameter/2) >= MediaQuery.of(context).size.height) {
      return true;
    }
    return false;
  }

  void updatePlayer(BuildContext context,Player player,double x) {
    if (x > 0 && player.x < MediaQuery.of(context).size.width - player.width) {
      player.x += x * 10;
    } else if (x < 0 && player.x > 0) {
      player.x += x * 10;
    }

  }

  String _findMin(double a, double b, double c, double d) {
    List<double> myList = [
      a,
      b,
      c,
      d,
    ];

    double currentMin = a;

    for (int i = 0; i < myList.length; i++) {
      if (myList[i] < currentMin) {
        currentMin = myList[i];
      }
    }

    if ((currentMin - a).abs() < 0.01) {
      return "left";
    } else if ((currentMin - b).abs() < 0.01) {
      return "right";
    } else if ((currentMin - c).abs() < 0.01) {
      return "top";
    } else if ((currentMin - d).abs() < 0.01) {
      return "bottom";
    }
    return "";
  }

}