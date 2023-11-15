import 'package:flutter/material.dart';
import 'package:movie_list/models/Movie.dart';
import 'package:movie_list/widgets/ImageWidget.dart';
import 'package:movie_list/screen/movie/DetailedScreen.dart';

class MovieGrid {

  static dynamic _item(Movie m,BuildContext context) {
    return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageWidget.homeImage(m.poster),
            Text(m.title,style: const TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Text(m.genre),
            Text('IMDB Rating: ${m.imdbRating}')
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedScreen(m)
          ),
        );
      },
    );
  }

  static grid(List<Movie> data) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 2, // Adjust as needed
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final m = data[index];
        return _item(m,context);
      },
    );
  }

}