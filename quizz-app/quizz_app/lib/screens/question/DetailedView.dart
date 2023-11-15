import 'package:flutter/material.dart';
import 'package:quizz_app/models/Category.dart';
import 'package:quizz_app/models/Question.dart';
import 'package:quizz_app/models/Score.dart';
import 'package:quizz_app/screens/score/ScoreView.dart';
import 'package:quizz_app/widgets/WidgetFactory.dart';

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

    if(widget.question == widget.category.questions.length) {
       Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreView(widget.category.name,widget.score,widget.category.imageUrl)
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz app: \n${widget.category.name}',style: const TextStyle(
          color: Colors.amber,
          ),
        ),
        flexibleSpace: Image(
          image: AssetImage(widget.category.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Text('Question ${widget.question+1} of ${widget.category.questions.length}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            if(widget.question < widget.category.questions.length)
              Text(widget.category.questions[widget.question].question,
                style:  const TextStyle(
                  fontSize: 20,
                ),
              ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WidgetFactory.hideShowBtn(!widget.nextQuestion, "True", () {setAnswer(true); } ),
                const SizedBox(width: 30),
                WidgetFactory.hideShowBtn(!widget.nextQuestion, "False", () {setAnswer(false); } ),
              ],
            ),
            WidgetFactory.hideShowBtn(widget.nextQuestion, "Next", () { nextQuestion(); } ),
            if(widget.answer.isNotEmpty)
              const SizedBox(height: 30),
            Visibility(
                visible: widget.answer.isNotEmpty,
                child: Text(widget.answer,style:  const TextStyle(
                    fontSize: 20,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

}