import 'package:flutter/material.dart';

class TextWidget {
  TextWidget();

  static dynamic detailedText(String text,String data,{bool newRow = false}) {
    if(newRow) {
      return Column(
        children: <Widget>[
          Text(text,style:  const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
          ),
          Text(data,style:  const TextStyle(
            fontSize: 20,
          ),
          ),
        ],
      );
    }
    return Row(
      children: <Widget>[
        Text(text,style:  const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(data,style:  const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );

  }

}