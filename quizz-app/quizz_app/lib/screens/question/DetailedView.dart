import 'package:flutter/material.dart';
import 'package:quizz_app/models/Category.dart';
import 'package:quizz_app/models/Question.dart';
import 'package:quizz_app/models/Score.dart';
import 'package:quizz_app/screens/score/ScoreView.dart';

class DetailedView extends StatefulWidget  {
  final Category category;
  int question = 0;
  Score score = Score();
  bool nextQuestion = false;
  String answer = '';

  DetailedView(this.category, {super.key}) {
    category.questions.shuffle();
  }

  @override
  State<DetailedView> createState() => _DetailedViewState();

}

class _DetailedViewState extends  State<DetailedView> {

  void setAnswer(bool a) {
    widget.nextQuestion = true;

    Question q = widget.category.questions[widget.question];

    if(q.answer == a) {
      widget.score.updateRight();
      widget.answer = 'You are guessed right';
    }else {
      widget.score.updateWrong();
      widget.answer = 'Your guessed $a, the actual answer was ${!a}';
    }

    setState(() {
      widget.nextQuestion; 
      widget.score;
      widget.answer;
    });

  }

  void nextQuestion() {
    setState(() {
      widget.question++;
      widget.nextQuestion = false;
      widget.answer = '';
    });

    if(widget.question+1 == widget.category.questions.length) {
       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreView(widget.category.name,widget.score)
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Quiz app: ${widget.category.name.toLowerCase()}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(widget.category.imageUrl),
          Text(widget.category.questions[widget.question].question),
          const SizedBox(height: 20),
          Visibility(
              visible: widget.answer.isNotEmpty,
              child: Text(widget.answer)
          ),
          if(widget.answer.isNotEmpty) 
            const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: !widget.nextQuestion,
                child: ElevatedButton(
                  onPressed: () {
                    setAnswer(true);
                  },
                  child: const Text('true'),
                ),
              ),
              Visibility(
                visible: !widget.nextQuestion,
                child: ElevatedButton(
                  onPressed: () {
                    setAnswer(false);
                  },
                  child: const Text('false'),
                ),
              ),
            ],
          ),
          // Add Next button with conditional visibility
          Visibility(
            visible: widget.nextQuestion,
            child: ElevatedButton(
              onPressed: () {
                nextQuestion();
              },
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }

}