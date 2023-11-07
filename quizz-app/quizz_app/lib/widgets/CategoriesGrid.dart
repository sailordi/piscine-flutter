import 'package:flutter/material.dart';
import 'package:quizz_app/models/Category.dart';
import 'package:quizz_app/screens/question/DetailedView.dart';

class CategoriesGrid extends StatelessWidget {
    final List<Category> categories;
    
    const CategoriesGrid(this.categories, {super.key});

    GestureDetector _categoryCard(Category cat,BuildContext context) {
      return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailedView(cat)
              ),
            );
          },
          child: Card(
            elevation: 0,
            color: Colors.black,

            child: Image.asset(cat.imageUrl,fit: BoxFit.cover),
          )
      );
    }

    @override
    Widget build(BuildContext context) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2, // Adjust as needed
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _categoryCard(category,context);
        },
      );
    }

}