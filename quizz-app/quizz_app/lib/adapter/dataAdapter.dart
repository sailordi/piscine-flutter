import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:quizz_app/models/Category.dart';
import 'package:quizz_app/models/Question.dart';

const int minQuestions = 10;
const int minCategories = 5;

class DataAdapter {
  DataAdapter();

  Future<List<Category> > getCategories() async {
    List<Category> ret = [];
    const dataDirectory = 'assets/data/';

    try {
      List<String> fileList = await _getFileList(dataDirectory);

      for(String filename in fileList) {
        Map<String, dynamic> jsonData = await _getJsonData('$dataDirectory$filename');
        Category cat = Category.fromJson(jsonData);

        if(cat.questions.length < minQuestions) {
          log('Error category has less than $minQuestions questions');  
        }else {
          ret.add(Category.fromJson(jsonData) );
        }

      }

    } catch (e) {
      log('Error reading files: $e');
    }

    if(ret.length < minCategories) {
      log('Error to few categories found need at least $minCategories categorys');
      exit(1); 
    }

    return ret;
  }

  Future<List<String> > _getFileList(String dataDirectory) async {
        final assetManifest = await rootBundle.loadString('AssetManifest.json');
        final Map<String, dynamic> manifest = json.decode(assetManifest);
        
        return manifest.keys
            .where((key) => key.startsWith(dataDirectory))
            .map((key) => key.replaceAll(dataDirectory, ''))
            .toList();
  }

  Future<Map<String, dynamic> > _getJsonData(String file) async {
      File jsonFile = File(file);
      String jsonString = await jsonFile.readAsString();
      return json.decode(jsonString);
  }

}