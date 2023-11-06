import 'package:flutter/material.dart';
import 'package:quizz_app/models/Category.dart';
import 'package:quizz_app/pages/QuestionPage.dart';

class CategoriesGrid extends StatelessWidget {
    List<Category> categories;
    
    CategoriesGrid(this.categories, {super.key});

    @override
    Widget build(BuildContext context) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust as needed
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
                onTap: () {
                    // Navigate to a different page when the image is pressed
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => QuestionPage(category),
                        ),
                    );
                    },
                    child: Card(
                    child: Column(
                        children: [
                        Image.asset(category.imageUrl),
                        Text(category.name),
                        ],
                    ),
                ),
            );
        },
    );
    }
}