import 'package:denge/models/word.dart';

class Category {
  const Category({
    required this.name,
    required this.imageAsset,
    required this.words,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json['name'] as String,
    imageAsset: json['image'] as String,
    words: [
      for (final word in json['words'] as List<dynamic>)
        Word.fromJson(word as Map<String, dynamic>),
    ],
  );

  final String name;
  final String imageAsset;
  final List<Word> words;
}
