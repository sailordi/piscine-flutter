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
    gyroscopeEventStream(samplingPeriod: const Duration(milliseconds: 50) ).listen((GyroscopeEvent event) {
      if (game.state == GameState.playing) {
        game.updatePlayer(context, player, event.y);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        ball = Game.initBall(context);
        player = Game.initPlayer(context);
        blocks = Game.initBlocks(context);
      });
    });

  }

  void _startGame() {
    setState(() {
      game.state = GameState.playing;
    });

    _gameLoop();
  }

  void _gameLoop() {
    Timer.periodic(const Duration(milliseconds: 10), (Timer timer) {
      if (game.state == GameState.playing) {
        bool hitPlayer = player.collision(ball.pos() );
        ball.updateDir(context,hitPlayer);
        ball.move();

        if(game.isDead(context, ball.pos(),Ball.diameter() ) ) {
          game.state = GameState.lost;
        }else {
          if(game.blockCollision(ball,blocks) == true) {
            game.state = GameState.won;
          }
        }

        setState(() {
          ball;
          blocks;
          game;
        });

        if(game.state != GameState.playing) {
          timer.cancel();
        }

      }

    });
  }

  void _restart(){
    _initGame();
    game.reset(context, ball, player, blocks);

    setState(() {
      ball;
      player;
      blocks;
    });

    _gameLoop();
  }

  dynamic _btn(String text,void Function() f,{String topText = ""}) {
    if(topText.isEmpty) {
      ElevatedButton(
        onPressed: f,
        child: Text(text),
      );
    }
    return Column(
        children: <Widget>[
          Text(topText),
          ElevatedButton(
            onPressed: f,
            child: Text(text),
          )
        ],
      );

  }

  dynamic _gameField() {
    if(game.state == GameState.won) {
      return Center(
        child: _btn("Continue game",_restart,topText: "You won"),
      );
    } else if(game.state == GameState.lost) {
      return Center(
        child: _btn("Restart game",_restart,topText: "You lost"),
      );
    }else if(game.state == GameState.notStarted) {
      return Center(
        child: _btn("Start game",_startGame),
      );
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ball.widget(),
          player.widget(),
          for (Block b in blocks)
          if (!b.broken)
          b.widget(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _gameField(),
      )
    );
  }

}