import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:movie_list/models/Movie.dart';

class DataAdapter {
  DataAdapter();

  Future<List<Movie>> getMovies() async {
    List<Movie> ret = [];

    try {
      List<dynamic> jasonData = await _getJsonData();
      ret = jasonData.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      log('Error reading files: $e');
    }

    ret.sort((a, b) => b.imdbRating.compareTo(a.imdbRating));

    return ret;
  }

  Future<List<dynamic>> _getJsonData() async {
    final String jsonString = await rootBundle.loadString(
        'assets/data/movies.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList;
  }

}