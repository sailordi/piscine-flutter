import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class ImageAdapter {

  static Future<List<File> > loadImages() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> imagePaths = prefs.getStringList('images') ?? [];
      List<File> ret = [];

      for(var fN in imagePaths) {
        try {
         ret.add(File(fN) );
        } on Exception catch (e) {
          log('Could not load file $fN');
        }

      }

      return ret;
  }

  static saveImages(List<File> images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> imagePaths = images.map((image) => image.path).toList();

    prefs.setStringList('images', imagePaths);
  }

  static Future _getImage(ImageSource source,void Function(File) addFile) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      addFile(File(pickedFile.path) );
    }

  }

  static void showImageSourceDialog(BuildContext context,void Function(File) addFile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _getImage(ImageSource.camera,addFile);
              },
              child: const Text("Camera"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _getImage(ImageSource.gallery,addFile);
              },
              child: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }

}