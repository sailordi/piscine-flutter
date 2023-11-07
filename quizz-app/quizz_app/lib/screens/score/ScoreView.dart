import 'package:flutter/material.dart';
import 'package:quizz_app/models/Score.dart';

class ScoreView extends StatelessWidget {
  final Score score;
  final String category;

  const ScoreView(this.category, this.score, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text('Quiz app: score for ${category.toLowerCase()}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(score.text()),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: const Text('Back to main screen'),
          ),
        ],
      ),
    );
  }
}