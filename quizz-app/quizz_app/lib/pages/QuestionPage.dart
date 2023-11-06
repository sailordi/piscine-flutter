import 'package:flutter/material.dart';
import 'package:quizz_app/models/Category.dart';
import 'package:quizz_app/models/Question.dart';

class QuestionPage extends StatefulWidget  {
  Category category = Category("", "", []);
  int question = 0,score = 0;
  bool nextQuestion = false;

  QuestionPage(Category cat, {super.key}) {
    category = cat;
    category.questions.shuffle();
  }

  QuestionPage.fromData(this.category,this.question,this.score, {super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();

}

class _QuestionPageState extends  State<QuestionPage> {

  void setAnswer(bool a) {
    setState(() {
      widget.nextQuestion = true;
    });

    Question q = widget.category.questions[widget.question];

    if(q.answer == a) {
      setState(() {
        widget.score++;
      });
    }

  }

  void nextQuestion() {
    setState(() {
      widget.question++;
    });

    if(widget.question+1 == widget.category.questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionPage.fromData(widget.category,widget.question,widget.score)
        ),
      );
    }else {

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(widget.category.imageUrl),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.category.questions[widget.question].question),
              Visibility(
                visible: !widget.nextQuestion,
                child: ElevatedButton(
                  onPressed: () {
                    setAnswer(true);
                  },
                  child: Text('True'),
                ),
              ),
              Visibility(
                visible: !widget.nextQuestion,
                child: ElevatedButton(
                  onPressed: () {
                    setAnswer(false);
                  },
                  child: Text('False'),
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
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }

}