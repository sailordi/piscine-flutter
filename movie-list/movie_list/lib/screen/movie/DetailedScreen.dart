import 'package:flutter/material.dart';
import 'package:movie_list/models/Movie.dart';
import 'package:movie_list/widgets/ImageWidget.dart';

class DetailedScreen extends StatelessWidget {
  final Movie movie;

  const DetailedScreen(this.movie,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieList: ${movie.title}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ImageWidget.detailedImage(movie.poster),
          Text('Genres:${movie.genre}',style:  const TextStyle(
            fontSize: 20,
          ),
          ),
          Text('Director: ${movie.director}',style:  const TextStyle(
            fontSize: 20,
          ),
          ),
          Text('Actors: ${movie.actors}',style:  const TextStyle(
            fontSize: 20,
          ),
          ),
          Text('Awards: ${movie.awards}',style:  const TextStyle(
            fontSize: 20,
          ),
          ),
          Text('Rating: ${movie.rating}',style:  const TextStyle(
            fontSize: 20,
          ),
          ),
          Text('IMDB rating: ${movie.imdbRating}',style:  const TextStyle(
            fontSize: 20,
          ),
          ),
        ],
      ),
    );
  }

}