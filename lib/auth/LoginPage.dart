import 'package:denge/auth/SignupPage.dart';
import 'package:denge/widget/DengeButton.dart';
import 'package:denge/widget/DengeInput.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff305F72),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffEAF9FE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                child: const Text(
                  "Kayıt Ol",
                  style: TextStyle(color: Color(0xff305F72)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()));
                },
              ),
            ),
          ),
        ],
      ),
      body: Form(
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(25),
                child: Image.asset(
                  "assets/images/kitap.png",
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: Color(0xffEAF9FE),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text("Giriş Yap"),
                    SizedBox(height: 20),
                    DengeInput(),
                    SizedBox(height: 20),
                    DengeInput(),
                    SizedBox(height: 20),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: DengeButton(
                          label: "Giriş Yap",
                          onPressed: () {},
                        )),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
