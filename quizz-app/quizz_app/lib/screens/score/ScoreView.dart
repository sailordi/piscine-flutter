import 'package:flutter/material.dart';
import 'package:quizz_app/models/Score.dart';

class ScoreView extends StatelessWidget {
  final Score score;
  final String category;
  final String imageUrl;

  const ScoreView(this.category, this.score,this.imageUrl, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz app:\n$category score',style: const TextStyle(
          color: Colors.amber,
        ),
        ),
        flexibleSpace: Image(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(score.text(),
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Back to main screen'),
            ),
          ],
        ),
      ),
    );
  }
}