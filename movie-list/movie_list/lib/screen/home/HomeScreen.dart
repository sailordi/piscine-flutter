import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:movie_list/adapter/DataAdapter.dart';
import 'package:movie_list/widgets/MovieList.dart';
import 'package:movie_list/models/Movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> _movies;
  final TextEditingController _searchController = TextEditingController();
  String query = "";

  @override
  void initState() {
    super.initState();
  }

  Future<List<Movie> > _loadMovies() async {
    DataAdapter a = DataAdapter();

    return a.getMovies();
  }

  List<Movie> _filteredMovies() {
    if(query.isEmpty) {
      return _movies;
    }
    return _movies.where((movie) =>
        movie.title.toLowerCase().contains(query) ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:EasySearchBar(
              title: const Text('Movie list'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              onSearch: (value) => setState(() => query = value)
      ),
      body: FutureBuilder<List<Movie> >(
          future: _loadMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading movies'));
            }else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No movies available'));
            } else {
              _movies = snapshot.data!;
              return MovieList.list(_filteredMovies() );
            }
          }
        ),
    );
  }

}