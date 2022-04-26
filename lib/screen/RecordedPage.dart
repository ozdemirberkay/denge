import 'package:denge/utils/appColors.dart';
import 'package:denge/widget/RecordedWidget.dart';
import 'package:flutter/material.dart';

class RecordedPage extends StatefulWidget {
  const RecordedPage({Key? key}) : super(key: key);

  @override
  State<RecordedPage> createState() => _RecordedPageState();
}

class _RecordedPageState extends State<RecordedPage> {
  List<String> deneme = ["aaaaaAA", "bb", "Cccccccccc", "ddddddd", "e", "xxxx"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "İNGİLİZCE",
              style: TextStyle(
                  fontSize: 24, color: darkColor, fontWeight: FontWeight.bold),
            ),
            Text(
              "TÜRKÇE",
              style: TextStyle(
                  fontSize: 24, color: darkColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 12,
          ),
          color: darkColor,
          height: 3,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return RecordedWidget(
                turkishWord: deneme[index],
                englishWord: deneme[index + 1],
              );
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: 12,
          ),
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 12,
            top: 12,
          ),
          decoration: BoxDecoration(
              color: darkColor, borderRadius: BorderRadius.circular(8)),
          child: const Text(
            "Kaydedilen Kelime Sayısı : 5",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: lightColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
