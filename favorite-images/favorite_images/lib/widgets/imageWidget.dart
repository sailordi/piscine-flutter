import 'dart:io';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class ImageWidget {
  static dynamic grid(File f) {
    if(!f.existsSync()) {
      return const Text('File no longer exists');
    }
    return Image.file(f, fit: BoxFit.cover);
  }

  static dynamic detailed(File f) {
    if(!f.existsSync()) {
      return const Text('File no longer exists');
    }
    return PhotoView(
      imageProvider: FileImage(f),
    );
  }
}