import 'package:denge/utils/appColors.dart';
import 'package:denge/widget/RecordedWidget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/word_model.dart';

class RecordedPage extends StatefulWidget {
  const RecordedPage({Key? key}) : super(key: key);

  @override
  State<RecordedPage> createState() => _RecordedPageState();
}

class _RecordedPageState extends State<RecordedPage> {
  var box = Hive.box<DengeWord>("word");

  @override
  Widget build(BuildContext context) {
    List<DengeWord> recordedList = getCustomWord();

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
            itemCount: recordedList.length,
            itemBuilder: (context, index) {
              return RecordedWidget(
                turkishWord: recordedList[index].turkish,
                englishWord: recordedList[index].english,
                onPressed: () {
                  DengeWord word = DengeWord(
                      recordedList[index].turkish, recordedList[index].english);

                  setState(() {
                    hiveDeleteData(word);
                  });
                },
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
          child: Text(
            "Kaydedilen Kelime Sayısı : " + box.length.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: lightColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }

  void hiveDeleteData(DengeWord dengeWord) {
    int i = 0;
    for (var element in box.values) {
      if (dengeWord.english == element.english &&
          dengeWord.turkish == element.turkish) {
        box.deleteAt(i);
      }
      i++;
    }
  }

  List<DengeWord> getCustomWord() {
    List<DengeWord> tempList = [];
    for (var element in box.values) {
      tempList.add(element);
    }
    return tempList;
  }
}
