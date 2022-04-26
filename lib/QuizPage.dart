import 'package:denge/utils/appColors.dart';
import 'package:denge/widget/DengeOptionButton.dart';
import 'package:denge/widget/DengeOutlinedButton.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> butunsecenekler = ["elma", "armut", "deneme", "ali", "veli"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DengeOutlinedButton(
              label: "Önceki Soru",
              icon: Icons.arrow_back,
              reverse: true,
              onPressed: () {},
            ),
            DengeOutlinedButton(
              label: "Sonraki Soru",
              icon: Icons.arrow_forward,
              onPressed: () {},
            ),
          ],
        ),
        Expanded(child: Container()),
        const Text(
          "SNAKE",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: darkColor, fontWeight: FontWeight.bold, fontSize: 36),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Kelimesinin anlamı aşağıdakilerden hangisidir?",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: darkColor, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        Expanded(child: Container()),
        Container(
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            color: darkColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(height: 20),
            DengeOptionButton(optiyon: "aa", correctAnswer: "aa"),
            DengeOptionButton(optiyon: "ava", correctAnswer: "asa"),
            DengeOptionButton(optiyon: "axa", correctAnswer: "aaa"),
            DengeOptionButton(optiyon: "aaaa", correctAnswer: "xaa"),
            DengeOptionButton(optiyon: "wwaa", correctAnswer: "asa"),
            const SizedBox(height: 20),
          ]),
          //     Expanded(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) {
          //       return DengeOptionButton(
          //           optiyon: butunsecenekler[index],
          //           correctAnswer: butunsecenekler[1]);
          //     },
          //     itemCount: 5,
          //   ),
          // ),
        )
      ],
    );
  }
}
