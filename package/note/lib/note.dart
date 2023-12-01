library note;

import 'package:intl/intl.dart';

class Note {
  int? id;
  String title;
  String body;
  String date = "";

  Note({int? id,required this.title,required this.body,String date = ""}) {
    if(date == "") {
      this.date = DateTime.now().toIso8601String();
    }else {
      this.date = date;
    }

    if(id != null) {
      this.id = id;
    }

  }

  String formattedDate(String format) {
    DateTime dateTime = DateTime.parse(date);

      return DateFormat(format).format(dateTime);
  }

  // Convert a Person object into a Map
  Map<String, dynamic> toMap() {
    return {
      if(id != null) 'id': id,
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
