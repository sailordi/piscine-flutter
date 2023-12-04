import 'package:flutter/material.dart';
import 'package:movie_list/models/Movie.dart';
import 'package:movie_list/widgets/ImageWidget.dart';
import 'package:movie_list/widgets/TextWidget.dart';

class DetailedScreen extends StatelessWidget {
  final Movie movie;

  const DetailedScreen(this.movie,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieList: ${movie.title}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageWidget.detailedImage(movie.poster),
            TextWidget.detailedText('Genres: ', movie.genre),
            TextWidget.detailedText('Director: ', movie.director),
            TextWidget.detailedText('Actors: ', movie.actors,newRow: true),
            TextWidget.detailedText('Awards: ', movie.awards,newRow: true),
            TextWidget.detailedText('Rating: ', movie.rating),
            TextWidget.detailedText('IMDB rating: ', movie.imdbRating),
          ],
        ),
      )
    );
  }

}