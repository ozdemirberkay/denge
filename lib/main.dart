import 'package:denge/app.dart';
import 'package:denge/data/saved_words_repository.dart';
import 'package:denge/data/vocabulary.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final (categories, savedWords) = await (
    loadCategories(),
    SavedWordsRepository.open(),
  ).wait;

  runApp(DengeApp(categories: categories, savedWords: savedWords));
}
