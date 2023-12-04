import 'package:flutter/material.dart';

class TextWidget {
  TextWidget();

  static dynamic textWithStyle(String t,TextStyle s) {
    return Text(t,style: s);
  }

  static dynamic detailedText(String text,String data,{bool newRow = false}) {
    if(newRow) {
      return Column(
        children: <Widget>[
          textWithStyle(text,const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          textWithStyle(data,const TextStyle(fontSize: 20) ),
        ],
      );
    }
    return Row(
      children: <Widget>[
        textWithStyle(text,const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        textWithStyle(data,const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );

  }

}