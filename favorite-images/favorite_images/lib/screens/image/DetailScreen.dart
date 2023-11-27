import 'dart:io';
import 'package:flutter/material.dart';
import 'package:favorite_images/widgets/imageWidget.dart';

class DetailedScreen extends StatelessWidget {
  final File _file;

  const DetailedScreen(this._file,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ImageWidget.detailed(_file)
    );
  }

}