import 'package:denge/data/strings.dart';
import 'package:denge/model/category.dart';
import 'package:denge/widget/CategoryWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  late List<Category> allCategories;
  HomePage({Key? key}) : super(key: key) {
    allCategories = getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        // padding: EdgeInsets.only(top: 8),
        itemCount: allCategories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: CategoryWidget(
              categoryName: allCategories[index].categoryName,
              categoryPhoto: allCategories[index].categoryPhoto,
            ),
          );
        },
      ),
    );
  }

  List<Category> getAllCategories() {
    List<Category> tempCategories = [];
    for (var i = 0; i < Strings.CATEGORIES.length; i++) {
      Category category = Category(Strings.CATEGORIES[i], Strings.PHOTOS[i]);
      tempCategories.add(category);
    }
    return tempCategories;
  }
}
