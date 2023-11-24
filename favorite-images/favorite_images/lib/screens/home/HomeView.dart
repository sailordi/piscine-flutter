import 'dart:io';
import 'package:flutter/material.dart';
import 'package:favorite_images/adapter/imageAdapter.dart';
import 'package:favorite_images/widgets/imageGrid.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<File> _images = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initImageList() async {
    _images = await ImageAdapter.loadImages();
    return;
  }

  void _addFile(File f) {
    setState(() {
      _images.add(f);
      ImageAdapter.saveImages(_images);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Favorite images"),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera),
            onPressed: () {
              ImageAdapter.showImageSourceDialog(context, _addFile);
            },
          ),
        ],
      ),
      body: Center(
        child:  FutureBuilder (
          future: _initImageList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading movies'));
            } else {
              return ImageGrid.grid(_images);
            }
          },
        ),
      ),
    );

  }

}
