import 'package:flutter/material.dart';

class RecordedPage extends StatefulWidget {
  const RecordedPage({Key? key}) : super(key: key);

  @override
  State<RecordedPage> createState() => _RecordedPageState();
}

class _RecordedPageState extends State<RecordedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: const [
            Text("İNGİLİZCE"),
            Text("TÜRKÇE"),
          ],
        )
      ]),
    );
  }
}
