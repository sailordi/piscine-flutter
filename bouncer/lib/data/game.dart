import 'dart:math';
import 'package:flutter/material.dart';
import 'ball.dart';
import 'block.dart';
import 'player.dart';

const double playerX = 100,playerY = 400.0;
const double ballX = 120,ballY = 380,ballSpeedX = 2,ballSpeedY = 2;
const numberOfBlockRows = 5;
const double blockWidth = 60,blockHeight = 20;

enum GameState{notStarted,playing,won,lost}

class Game{
  late GameState state;

  Game() {
    state = GameState.notStarted;
  }

  static Player initPlayer() {
    return Player(x: playerX, y:playerY, width: 80.0, height: 10.0);

  }

  static Ball initBall() {
    return Ball(x: ballX, y: ballY, speedX: ballSpeedX,speedY: ballSpeedY);
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

  void reset(Ball ball,Player player,List<Block> blocks) {

    ball.speedX = ballSpeedX;
    ball.speedY = ballSpeedY;
    ball.x = ballX;
    ball.y = ballY;

    player.x = playerX;
    player.y = playerY;

    for(Block b in blocks) {
      b.broken = false;
    }

    state = GameState.playing;
  }

  void _playerCollision(Ball ball,Player player) {
    // Check collision with player
    if (ball.y + 10 >= player.y &&
        ball.x >= player.x &&
        ball.x <= player.x + player.width &&
        ball.y <= player.y + player.height) {
      ball.speedY = -ball.speedY;
    }

  }

  void _blockCollision(Ball ball,List<Block> blocks) {
    int active = blocks.length;

    for(Block b in blocks) {
      if(b.broken) {
        active--;
        continue;
      }

      if(ball.y - 10 <= b.y + b.height &&
          ball.x >= b.x &&
          ball.x <= b.x + b.width &&
          ball.y >= b.y) {
        ball.speedY = -ball.speedY;
        b.broken = true;
        active--;
      }

    }

    if(active == 0){
      state = GameState.won;
    }

  }

  void checkCollision(BuildContext context,Player player,Ball ball,List<Block> blocks) {
    if(state != GameState.playing) {
      return;
    }

    _playerCollision(ball, player);

    _blockCollision(ball, blocks);

    if(state != GameState.playing) {
      return;
    }

    // Check collision with bottom
    if (ball.y + 10 >= MediaQuery.of(context).size.height) {
      state = GameState.lost;
    }

  }

  void updatePlayer(BuildContext context,Player player,double x) {
    if (x > 0 && player.x < MediaQuery.of(context).size.width - player.width) {
      player.x += x * 10;
    } else if (x < 0 && player.x > 0) {
      player.x += x * 10;
    }

  }

}