import 'package:flutter/material.dart';

class ImageWidget {
  ImageWidget();

  static dynamic homeImage(String imageUrl) {
    try {
      return Image.network(
        imageUrl,
        width: 200.0,
        height: 200.0,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Text('Image not available');
        },
      );
    }catch(e) {
      return const Text('Image not available');
    }

  }

  static dynamic detailedImage(String imageUrl) {
    try {
      return Image.network(
        imageUrl,
        height: 450.0,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Text('Image not available');
        },
      );
    }catch(e) {
      return const Text('Image not available');
    }
  }

}