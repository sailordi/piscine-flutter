import 'package:flutter/material.dart';
import 'package:movie_list/adapter/DataAdapter.dart';
import 'package:movie_list/widgets/MovieList.dart';
import 'package:movie_list/models/Movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Movie> > loadMovies() {
    DataAdapter a = DataAdapter();

    return a.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieList'),
      ),
      body: FutureBuilder<List<Movie> >(
        future: loadMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading movies'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No movies available'));
          } else {
            return MovieList.list(snapshot.data!);
          }
        }
      ),
    );
  }

}