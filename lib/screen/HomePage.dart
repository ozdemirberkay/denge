import 'package:denge/constants/data.dart';
import 'package:denge/model/category.dart';
import 'package:denge/widget/CategoryWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> allCategories = [];

  @override
  void initState() {
    super.initState();
    allCategories = AppData.categories;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      // padding: EdgeInsets.only(top: 8),
      itemCount: allCategories.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: CategoryWidget(category: allCategories[index]),
        );
      },
    );
  }
}
