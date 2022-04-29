import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  @override
  Widget build(BuildContext context) {
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
        const Text(
          "Berkay Özdemir",
          textAlign: TextAlign.center,
          style: TextStyle(
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
                child: const Text(
                  "86",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: darkColor, fontWeight: FontWeight.bold),
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
                child: const Text(
                  "86",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: darkColor, fontWeight: FontWeight.bold),
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
                  children: const [
                    Text(
                      "Başarı Yüzdesi : ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: darkColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "%43",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: darkColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Slider(
                activeColor: Colors.green,
                inactiveColor: lightColor,
                value: 43,
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
