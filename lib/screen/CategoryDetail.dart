import 'package:denge/data/strings.dart';
import 'package:denge/utils/appColors.dart';
import 'package:denge/widget/DengeOutlinedButton.dart';
import 'package:flutter/material.dart';

import '../model/category_data.dart';

class CategoryDetail extends StatefulWidget {
  final String categoryName;
  final String categoryPhoto;
  late List<CategoryData> allData;

  CategoryDetail(
      {Key? key, required this.categoryName, required this.categoryPhoto})
      : super(key: key) {
    allData = getData();
  }

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/${widget.categoryPhoto}";

    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: darkColor,
        ),
        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: const TextStyle(color: darkColor, fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0, left: 24, right: 24),
              child: Image(image: AssetImage(imagePath)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 12.0, left: 24, right: 24),
            decoration: BoxDecoration(
                color: darkColor, borderRadius: BorderRadius.circular(12)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "${(index + 1).toString()}/${(widget.allData.length).toString()} ",
                      style: const TextStyle(
                          color: darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  const SizedBox(width: 10),
                  FloatingActionButton.small(
                    elevation: 0,
                    backgroundColor: lightColor,
                    onPressed: () {},
                    child: const Icon(
                      Icons.bookmark,
                      color: darkColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        AssetImage("assets/images/ingilizbayrak.png"),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "İngilizce",
                    style: TextStyle(
                        color: lightColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  bottom: 8,
                  top: 8,
                ),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  (widget.allData[index].ingilizce),
                  style: const TextStyle(
                      color: darkColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: const [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage("assets/images/türkbayrak.png"),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Türkçe",
                    style: TextStyle(
                        color: lightColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  bottom: 8,
                  top: 8,
                ),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  (widget.allData[index].turkce),
                  style: const TextStyle(
                      color: darkColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DengeOutlinedButton(
                label: "Önceki Kelime",
                icon: Icons.arrow_back,
                reverse: true,
                onPressed: () {
                  if (index > 0) {
                    setState(() {
                      index--;
                    });
                  }
                },
              ),
              DengeOutlinedButton(
                label: "Sonraki Kelime",
                icon: Icons.arrow_forward,
                onPressed: () {
                  if (index < widget.allData.length - 1) {
                    setState(() {
                      index++;
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

List<CategoryData> getData() {
  late List<CategoryData> tempAllData = [];

  for (var item in Strings.DATA) {
    CategoryData temp = CategoryData.fromMap(item);
    tempAllData.add(temp);
  }
  return tempAllData;
}
