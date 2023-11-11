import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie_list/models/Movie.dart';

class MovieListItem {
  MovieListItem();

  static ListTile item(Movie m) {
    try {
      return ListTile(
          leading:
          Image.network(
            m.poster,
            width: 50.0,
            height: 50.0,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Text('Image not available');
            },
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(m.title),
              Text(m.genre),
              Text('IMDB Rating: ${m.imdbRating}')
            ],
          )
      );
    } catch (e) {
      return ListTile(
          leading: const Text('Image not available'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(m.title),
              Text(m.genre),
              Text('IMDB Rating: ${m.imdbRating}')
            ],
          )
      );
    }
  }

}