import 'package:denge/auth/LoginPage.dart';
import 'package:denge/auth/SignupPage.dart';
import 'package:denge/utils/appColors.dart';
import 'package:denge/widget/DengeButton.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              child: Image.asset("assets/images/kitap.png"),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: lightColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  Expanded(child: Container()),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "D",
                        style: TextStyle(
                            color: darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                      TextSpan(
                        text: "ENG",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 52),
                      ),
                      TextSpan(
                        text: "E",
                        style: TextStyle(
                            color: darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                    ]),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "İngilizce öğrenmenin ve tekrar etmenin en kolay yolu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DengeButton(
                              label: "Giriş Yap",
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: DengeButton(
                              label: "Kayıt Ol",
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupPage()));
                              },
                            ),
                          )
                        ]),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
