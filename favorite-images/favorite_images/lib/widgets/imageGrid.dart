import 'dart:io';
import 'package:flutter/material.dart';

class ImageGrid {

  static dynamic _item(File f,BuildContext context) {
    return GestureDetector(
      child: Image.file(f, fit: BoxFit.cover),
      /*onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(f)
          ),
        );
      },*/
    );
  }

  static grid(List<File> data) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 2, // Adjust as needed
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final m = data[index];
        return _item(m,context);
      },
    );
  }

}