import 'package:flutter/material.dart';

class WidgetFactory {
  WidgetFactory();

  static Visibility hideShowBtn(bool visible,String text,void Function()? onPress) {
    return Visibility(
        visible: visible,
        child: ElevatedButton(
          onPressed: onPress,
          child: Text(text),
        ),
    );
  }

  static Stack imageWithText(String imageUrl,String text,Color color) {
    return Stack(
      children: <Widget>[
        Image.asset(imageUrl,fit: BoxFit.cover),
        Text(text,style:  TextStyle(
          color: color,
        )
        )
      ],
    );
  }
}