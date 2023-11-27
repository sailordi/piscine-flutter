import 'dart:io';
import 'package:flutter/material.dart';
import 'package:favorite_images/widgets/imageWidget.dart';
import 'package:favorite_images/screens/image/DetailScreen.dart';

class ImageGrid {

  static dynamic _item(File f,BuildContext context) {
    return GestureDetector(
      child: ImageWidget.grid(f),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedScreen(f)
          ),
        );
      },
    );
  }

  static dynamic grid(List<File> data) {
    if(data.isEmpty) {
      return const Text("No images selected");
    }

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