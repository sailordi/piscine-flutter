import 'package:flutter/material.dart';
import 'package:movie_list/models/Movie.dart';

class MovieListItem {
  MovieListItem();

  static ListTile item(Movie m) {
    return ListTile(
      title: Text(m.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(m.genre)
        ],
      ),
      leading: Image.network(
        m.poster,
        width: 50.0,
        height: 50.0,
        fit: BoxFit.cover
      ),
    );
  }

}