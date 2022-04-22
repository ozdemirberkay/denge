import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: lightColor,
    );
  }
}
