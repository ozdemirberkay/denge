import 'dart:convert';

import 'package:denge/models/category.dart';
import 'package:flutter/services.dart';

const _categoriesAsset = 'assets/data/categories.json';

/// Loads the bundled word categories from [_categoriesAsset].
Future<List<Category>> loadCategories() async {
  final raw = await rootBundle.loadString(_categoriesAsset);
  return [
    for (final category in jsonDecode(raw) as List<dynamic>)
      Category.fromJson(category as Map<String, dynamic>),
  ];
}
