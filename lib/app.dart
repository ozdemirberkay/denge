import 'package:denge/data/saved_words_repository.dart';
import 'package:denge/models/category.dart';
import 'package:denge/screens/home_screen.dart';
import 'package:denge/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DengeApp extends StatelessWidget {
  const DengeApp({
    super.key,
    required this.categories,
    required this.savedWords,
  });

  final List<Category> categories;
  final SavedWordsRepository savedWords;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Denge',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: HomeScreen(categories: categories, savedWords: savedWords),
    );
  }
}
