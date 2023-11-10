import 'package:flutter/material.dart';
import 'package:movie_list/widgets/MovieListItem.dart';
import 'package:movie_list/models/Movie.dart';

class MovieList {
  MovieList();

  static ListView list(List<Movie> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return MovieListItem.item(data[index]);
        }
    );
  }

}