import 'package:flutter/material.dart';
import '../bloc/counter_bloc.dart';

class YourWidgets {
  static dynamic btn(String t,Icon i,void Function() f) {
    return FloatingActionButton(
      onPressed: f,
      tooltip: t,
      child: i,
    );
  }

}