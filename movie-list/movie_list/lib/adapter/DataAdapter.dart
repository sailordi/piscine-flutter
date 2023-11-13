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

    ret.sort(_ratingSort);

    return ret;
  }

  Future<List<dynamic>> _getJsonData() async {
    final String jsonString = await rootBundle.loadString(
        'assets/data/movies.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList;
  }

  int _ratingSort(Movie a,Movie b) {
    if (a.imdbRating == "N/A" && b.imdbRating != "N/A") {
      return 1; // "N/A" comes first
    } else if (a.imdbRating != "N/A" && b.imdbRating == "N/A") {
      return -1; // "N/A" comes first
    }
    else {
      return b.imdbRating.compareTo(a.imdbRating);
    }

  }

}