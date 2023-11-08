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
}