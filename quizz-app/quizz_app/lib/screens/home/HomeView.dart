import 'package:flutter/material.dart';
import 'package:quizz_app/adapter/DataAdapter.dart';
import 'package:quizz_app/models/Category.dart';
import 'package:quizz_app/widgets/CategoriesGrid.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    DataAdapter dataA = DataAdapter();
    List<Category> loadedCategories = await dataA.getCategories();

    setState(() {
      categories = loadedCategories;
    });
    
  } 

  @override
  Widget build(BuildContext context) {
    if(categories.isEmpty) {
      return const CircularProgressIndicator();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quiz app"),
      ),
      body: Center(
          child: CategoriesGrid(categories)
      ),
    );

  }
  
}
