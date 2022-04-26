import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';

class RecordedWidget extends StatelessWidget {
  final String englishWord;
  final String turkishWord;
  const RecordedWidget(
      {Key? key, required this.englishWord, required this.turkishWord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      margin: const EdgeInsets.only(
        left: 18,
        right: 18,
        bottom: 12,
      ),
      decoration: BoxDecoration(
          color: darkColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/ingilizbayrak.png"),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 6,
                right: 6,
                bottom: 8,
                top: 8,
              ),
              decoration: BoxDecoration(
                color: lightColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                englishWord,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: darkColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 5),
          FloatingActionButton.small(
            elevation: 0,
            backgroundColor: lightColor,
            onPressed: () {},
            child: const Icon(
              Icons.bookmark,
              color: darkColor,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 6,
                right: 6,
                bottom: 8,
                top: 8,
              ),
              decoration: BoxDecoration(
                color: lightColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                turkishWord,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: darkColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 5),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/türkbayrak.png"),
          ),
        ],
      ),
    );
  }
}
