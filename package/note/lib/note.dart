library note;

class Note {
  final int id;
  String title;
  String body;
  String date;

  Note({required this.id,
    required this.title,
    required this.body,
    required this.date});

  // Convert a Person object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'date': date,
    };
  }

  // Create a Person object from a Map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      date: map['date'],
    );
  }

}
