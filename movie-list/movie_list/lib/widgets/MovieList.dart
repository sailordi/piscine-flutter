import 'package:flutter/material.dart';
import 'package:movie_list/models/Movie.dart';
import 'package:movie_list/widgets/ImageWidget.dart';
import 'package:movie_list/screen/movie/DetailedScreen.dart';

class MovieList {
  MovieList();

  static ListView list(List<Movie> data) {
    if(data.length < 2) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Row(
              children: <Widget>[
                Expanded(child: _item(data[index],context) ),
              ],
            );
          }
      );
    }

    return ListView.builder(
        itemCount: data.length~/2,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Expanded(child: _item(data[index*2],context) ),
              if(index*2+1 < data.length)
                Expanded(child: _item(data[index*2+1],context) ),
            ],
          );
        }
    );
  }

  static ListTile _item(Movie m,BuildContext context) {
      return ListTile(
          subtitle:
          Container(
            height: 285.0,
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

}