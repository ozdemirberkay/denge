import 'package:denge/constants/appColors.dart';
import 'package:denge/constants/data.dart';
import 'package:flutter/material.dart';

class RecordedWidget extends StatelessWidget {
  final String englishWord;
  final String turkishWord;
  final VoidCallback? onPressed;
  const RecordedWidget(
      {super.key,
      required this.englishWord,
      required this.turkishWord,
      this.onPressed});

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
            backgroundImage: AssetImage(AppData.enFlag),
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
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    englishWord,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: darkColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          FloatingActionButton.small(
            elevation: 0,
            backgroundColor: lightColor,
            onPressed: onPressed,
            child: const Icon(
              Icons.bookmark_remove,
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
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    turkishWord,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: darkColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          const CircleAvatar(
            backgroundImage: AssetImage(AppData.trFlag),
          ),
        ],
      ),
    );
  }
}
