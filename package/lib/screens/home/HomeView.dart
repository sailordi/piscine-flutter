import 'package:flutter/material.dart';
import 'package:note/note.dart';
import 'package:note/database_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadData() async {

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Package"),
      ),
      body: const Center(
          child: Text("Tmp"),
      ),
    );

  }

}