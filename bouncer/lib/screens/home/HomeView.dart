import 'dart:async';
import 'package:bouncer/data/block.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:bouncer/data/game.dart';
import 'package:bouncer/data/ball.dart';
import 'package:bouncer/data/block.dart';
import 'package:bouncer/data/player.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {
  Game game = Game();
  late Ball ball;
  late Player player;
  List<Block> blocks = [];

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    ball = Game.initBall();
    player = Game.initPlayer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        blocks = Game.initBlocks(context);
      });
    });
  }

  void _startGame() {
    setState(() {
      game.state = GameState.playing;
    });

    // Game loop
    Timer.periodic(const Duration(milliseconds: 16), (Timer timer) {
      if (game.state == GameState.playing) {
        setState(() {
          ball.move();
          game.checkCollision(context,player,ball,blocks);
        });
      }

    });
  }

  void _restart(){
    _initGame();
    _startGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ball.widget(),
          player.widget(),
          for (Block b in blocks)
            if (!b.broken)
              b.widget(),
          if(game.state == GameState.notStarted)
            ElevatedButton(
              onPressed: _startGame,
              child: const Text("Start game"),
            ),
          if(game.state == GameState.lost)
            const Text("You lost"),
            ElevatedButton(
              onPressed: _restart,
              child: const Text("Restart game"),
            ),
          if(game.state == GameState.won)
            const Text("You lost"),
            ElevatedButton(
              onPressed: _restart,
              child: const Text("Restart game"),
            ),
        ],
      ),
    );
  }

}