import 'package:denge/data/saved_words_repository.dart';
import 'package:denge/models/category.dart';
import 'package:denge/screens/flashcard_screen.dart';
import 'package:denge/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.categories,
    required this.savedWords,
  });

  final List<Category> categories;
  final SavedWordsRepository savedWords;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 240,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryCard(
          category: category,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) =>
                  FlashcardScreen(category: category, savedWords: savedWords),
            ),
          ),
        );
      },
    );
  }
}
