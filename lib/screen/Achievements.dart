import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denge/utils/appColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  var box = Hive.box("achievements");
  String name = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> getName() async {
    var snapshot =
        await firestore.collection("users").doc(auth.currentUser!.uid).get();
    Map<String, dynamic>? dataMap = snapshot.data();

    name = dataMap!["nameSurname"];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    int correct = box.get("correct");
    int total = box.get("total");

    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: darkColor,
        ),
        centerTitle: true,
        title: const Text(
          "Başarılar",
          style: TextStyle(color: darkColor, fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        const SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: darkColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          margin: const EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: 12,
          ),
          decoration: BoxDecoration(
              color: darkColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  "Doğru Cevap Sayısı:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: lightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  correct.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: darkColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          margin: const EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: 12,
          ),
          decoration: BoxDecoration(
              color: darkColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  "Çözülen Soru Sayısı :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: lightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                width: 100,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  total.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: darkColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          margin: const EdgeInsets.only(
            left: 28,
            right: 28,
            bottom: 12,
          ),
          decoration: BoxDecoration(
              color: darkColor, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Başarı Yüzdesi : ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: darkColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "% ${((correct / total) * 100).toStringAsFixed(2)}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: darkColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Slider(
                activeColor: Colors.green,
                inactiveColor: lightColor,
                value: ((correct / total) * 100),
                onChanged: (value) {},
                min: 0,
                max: 100,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
