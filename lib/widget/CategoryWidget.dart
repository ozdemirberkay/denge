import 'package:denge/screen/CategoryDetail.dart';
import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final String categoryPhoto;
  final int categoryIndex;

  const CategoryWidget(
      {Key? key,
      required this.categoryName,
      required this.categoryPhoto,
      required this.categoryIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/$categoryPhoto";
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetail(
                categoryIndex: categoryIndex,
                categoryPhoto: categoryPhoto,
                categoryName: categoryName,
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: darkColor, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(8),
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
      ),
    );
  }
}
