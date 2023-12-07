import 'package:flutter/material.dart';

class FavoritePlacesView extends StatefulWidget {
  const FavoritePlacesView({super.key});

  @override
  State<FavoritePlacesView> createState() => _FavoritePlacesViewState();
}

class _FavoritePlacesViewState extends State<FavoritePlacesView> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Map makers: Favorites'),
          elevation: 2,
        ),
        body:
        const Text("Favorite places"),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}