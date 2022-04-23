import 'package:denge/utils/appColors.dart';
import 'package:denge/widget/DengeOutlinedButton.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatefulWidget {
  final String categoryName;
  final String categoryPhoto;
  const CategoryDetail(
      {Key? key, required this.categoryName, required this.categoryPhoto})
      : super(key: key);

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
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
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0, left: 24, right: 24),
            child: Image(image: AssetImage(imagePath)),
          ),
          Container(
            padding: EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 12.0, left: 24, right: 24),
            decoration: BoxDecoration(
                color: darkColor, borderRadius: BorderRadius.circular(12)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: const BoxDecoration(color: lightColor),
                    child: const Text(
                      "5/67",
                      style: TextStyle(color: darkColor),
                    ),
                  ),
                  FloatingActionButton(
                    elevation: 0,
                    backgroundColor: lightColor,
                    onPressed: () {},
                    child: const Icon(
                      Icons.bookmark,
                      color: darkColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage("assets/images/ingilizbayrak.png")),
                  Text(
                    "İngilizce",
                    style: TextStyle(color: lightColor),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Crocodile"),
              ),
              Row(
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage("assets/images/türkbayrak.png")),
                  Text(
                    "Türkçe",
                    style: TextStyle(color: lightColor),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Crocodile"),
              ),
            ]),
          ),
          Row(
            children: [
              DengeOutlinedButton(
                label: "Önceki Kelime",
                icon: Icons.arrow_back,
                reverse: true,
                onPressed: () {},
              ),
              DengeOutlinedButton(
                label: "Sonraki Kelime",
                icon: Icons.arrow_forward,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
