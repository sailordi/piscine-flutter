import 'package:quizz_app/models/Question.dart';

class Category {
  String name;
  String imageUrl;
  List<Question> questions;

  Category(this.name, this.imageUrl, this.questions);

  factory Category.fromJson(Map<String, dynamic> json) {
    final List<dynamic> questionsList = json['questions'];
    final List<Question> parsedQuestions = questionsList
      .map((question) => Question.fromJson(question))
      .toList();

    String image = json['image'];

    return Category(
      json['name'],
      'assets/images/$image',
      parsedQuestions,
    );

  }

}