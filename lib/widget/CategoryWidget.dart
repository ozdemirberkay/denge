import 'package:denge/model/category.dart';
import 'package:denge/screen/CategoryDetail.dart';
import 'package:denge/constants/appColors.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetail(
                categoryPhoto: category.photo,
                categoryName: category.name,
                allData: category.data,
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
              image: AssetImage(category.photo),
            )),
            Text(
              category.name,
              style: const TextStyle(color: lightColor, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
