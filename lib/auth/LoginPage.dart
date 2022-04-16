import 'package:denge/auth/SignupPage.dart';
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
      body: const Center(child: Text("Content")),
    );
  }
}
