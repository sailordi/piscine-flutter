import 'package:flutter/material.dart';
import 'package:movie_list/widgets/MovieListItem.dart';
import 'package:movie_list/models/Movie.dart';

class MovieList {
  MovieList();

  static ListView list(List<Movie> data) {
    return ListView.builder(
        itemCount: data.length~/2,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Expanded(child: MovieListItem.item(data[index*2]) ),
              if(index*2+1 < data.length)
                Expanded(child: MovieListItem.item(data[index*2+1]) ),
            ],
          );
        }
    );
  }

}