import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denge/model/question_model.dart';
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
  late final Future<List<Question>> allFutureQuestion;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int index = 0;
  bool isDisable = false;

  @override
  void initState() {
    allFutureQuestion = getQuizQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: allFutureQuestion,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Question> allQuestion = snapshot.data as List<Question>;

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
                      onPressed: () {
                        if (index > 0) {
                          setState(() {
                            isDisable = false;

                            index--;
                          });
                        } else {
                          final snackBar = SnackBar(
                            content: const Text(
                              'İlk Sorudasınız',
                              textAlign: TextAlign.center,
                            ),
                            action: SnackBarAction(
                                textColor: darkColor,
                                label: "Kapat",
                                onPressed: () {}),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                    DengeOutlinedButton(
                      label: "Sonraki Soru",
                      icon: Icons.arrow_forward,
                      onPressed: () {
                        if (index < allQuestion.length - 1) {
                          setState(() {
                            isDisable = false;

                            index++;
                          });
                        } else {
                          final snackBar = SnackBar(
                            content: const Text(
                              'Son Sorudasınız',
                              textAlign: TextAlign.center,
                            ),
                            action: SnackBarAction(
                                textColor: darkColor,
                                label: "Kapat",
                                onPressed: () {}),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Text(
                  allQuestion[index].question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: darkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Kelimesinin anlamı aşağıdakilerden hangisidir?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: darkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        DengeOptionButton(
                          option: allQuestion[index].answer1,
                          correctAnswer: allQuestion[index].correctAnswer,
                        ),
                        DengeOptionButton(
                          option: allQuestion[index].answer2,
                          correctAnswer: allQuestion[index].correctAnswer,
                        ),
                        DengeOptionButton(
                          option: allQuestion[index].answer3,
                          correctAnswer: allQuestion[index].correctAnswer,
                        ),
                        DengeOptionButton(
                          option: allQuestion[index].answer4,
                          correctAnswer: allQuestion[index].correctAnswer,
                        ),
                        DengeOptionButton(
                          option: allQuestion[index].answer5,
                          correctAnswer: allQuestion[index].correctAnswer,
                        ),
                        const SizedBox(height: 20),
                      ]),
                  //     Expanded(
                  //   child: ListView.builder(
                  //     itemBuilder: (context, index) {
                  //       return DengeOptionButton(
                  //           option: butunsecenekler[index],
                  //           correctAnswer: butunsecenekler[1]);
                  //     },
                  //     itemCount: 5,
                  //   ),
                  // ),
                )
              ],
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: darkColor,
            ));
          }
        });
  }

  Future<List<Question>> getQuizQuestion() async {
    List<Question> allQuestion = [];

    var _questionDoc = await firestore.collection("questions").get();
    for (var item in _questionDoc.docs) {
      Map userMap = item.data();
      Question temp = Question(
        userMap["question"],
        userMap["answer1"],
        userMap["answer2"],
        userMap["answer3"],
        userMap["answer4"],
        userMap["answer5"],
        userMap["correctAnswer"],
      );
      allQuestion.add(temp);
    }
    return allQuestion;
  }

  void buttonFunc() {
    isDisable = true;
  }
}
