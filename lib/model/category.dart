import 'package:denge/model/category_data.dart';

class Category {
  final String name;
  final String photo;
  final List<CategoryData> data;

  Category({required this.name, required this.photo, required this.data});
}
