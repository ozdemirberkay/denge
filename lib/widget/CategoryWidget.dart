import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final String categoryPhoto;

  const CategoryWidget(
      {Key? key, required this.categoryName, required this.categoryPhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/$categoryPhoto";
    return Container(
      decoration: BoxDecoration(
          color: darkColor, borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
              child: Image(
            image: AssetImage(imagePath),
          )),
          Text(
            categoryName,
            style: const TextStyle(color: lightColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
