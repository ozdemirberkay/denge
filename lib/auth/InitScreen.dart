import 'package:denge/auth/LoginPage.dart';
import 'package:denge/auth/SignupPage.dart';
import 'package:denge/optiyol/MessageUsers.dart';
import 'package:denge/widget/DengeButton.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff305F72),
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
                color: Color(0xffEAF9FE),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  const Text("DENGE"),
                  const SizedBox(height: 20),
                  const Text(
                      "İngilizce öğrenmenin ve tekrar etmenin en kolay yolu"),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  DengeButton(
                    label: "Optiyol",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MessageUsers(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
