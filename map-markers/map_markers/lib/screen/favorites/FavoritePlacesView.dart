import 'package:flutter/material.dart';

class FavoritePlacesView extends StatefulWidget {
  const FavoritePlacesView({super.key});

  @override
  State<FavoritePlacesView> createState() => _FavoritePlacesViewState();

}

class _FavoritePlacesViewState extends State<FavoritePlacesView> {
  List<String> _favoritePlaces = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _favoritePlaces.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_favoritePlaces[index]),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _favoritePlaces.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }
}