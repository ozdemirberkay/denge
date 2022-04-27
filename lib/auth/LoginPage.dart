import 'package:denge/DashboardScreen.dart';
import 'package:denge/auth/SignupPage.dart';
import 'package:denge/utils/appColors.dart';
import 'package:denge/widget/DengeButton.dart';
import 'package:denge/widget/DengeInput.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String validateName(String value) {
      if (value.length == 0) {
        return "Name is Required";
      } else {
        return "tamam kardeş";
      }
    }

    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: lightColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                child: const Text(
                  "Kayıt Ol",
                  style: TextStyle(
                    color: darkColor,
                  ),
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
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            reverse: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(
                    "assets/images/kitap.png",
                    height: 2 * MediaQuery.of(context).size.height / 5,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Giriş Yap",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      DengeInput(
                        labelText: "Email",
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: Icons.email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email Giriniz";
                          } else if (EmailValidator.validate(value)) {
                            return "Geçerli Bir Email Giriniz";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      DengeInput(
                        labelText: "Şifre",
                        controller: _passwordController,
                        obscureText: true,
                        suffixIcon: Icons.lock,
                      ),
                      const SizedBox(height: 20),
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DengeButton(
                            label: "Giriş Yap",
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: ((context) =>
                              //             const DashboardScreen())));
                            },
                          )),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
