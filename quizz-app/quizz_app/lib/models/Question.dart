class Question {
  String question;
  bool answer;
  String actual;

  Question(this.question, this.answer, this.actual);

  factory Question.fromJson(Map<String, dynamic> json) { 
    return Question(
      json['question'],
      json['answer'],
      json['actual'],
    );
    
  }
}