import 'package:flutter/material.dart';
import 'package:quizz_app/models/Category.dart';
import 'package:quizz_app/screens/question/DetailedView.dart';
import 'package:quizz_app/widgets/WidgetFactory.dart';

class CategoriesGrid {

    static dynamic _categoryCard(Category cat,BuildContext context) {
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

            child: WidgetFactory.imageWithText(cat.imageUrl, cat.name, Colors.white),
          )
      );
    }

    static GridView grid(List<Category> categories) {
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