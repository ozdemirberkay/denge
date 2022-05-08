import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denge/DashboardScreen.dart';
import 'package:denge/auth/LoginPage.dart';
import 'package:denge/utils/appColors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/DengeButton.dart';
import '../widget/DengeInput.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordAgainController;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordAgainController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

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
                  "Giriş Yap",
                  style: TextStyle(
                    color: darkColor,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              ),
            ),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            reverse: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(
                    "assets/images/kitap.png",
                    height: MediaQuery.of(context).size.height / 4,
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
                      const Text("Kayıt Ol",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      DengeInput(
                        labelText: "İsim Soyisim",
                        controller: _nameController,
                        suffixIcon: Icons.person,
                        validator: (value) {
                          if (value!.length < 3) {
                            return "İsim ve Soyisminiz 3 karakterden kısa olamaz";
                          }
                          return null;
                        },
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
                          } else if (!EmailValidator.validate(value)) {
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Şifre Giriniz";
                          } else if (value.length < 8) {
                            return "Şifreniz 8 Karakterden az Olamaz";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      DengeInput(
                        labelText: "Şifre Tekrar",
                        controller: _passwordAgainController,
                        obscureText: true,
                        suffixIcon: Icons.lock,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Şifre Giriniz";
                          } else if (value.length < 8) {
                            return "Şifreniz 8 Karakterden az Olamaz";
                          } else if (value != _passwordController.text) {
                            return "Şifreler Aynı Değil";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DengeButton(
                            label: "Kayıt Ol",
                            onPressed: () async {
                              bool _validate =
                                  _formKey.currentState!.validate();
                              if (_validate) {
                                await auth
                                    .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                )
                                    .then((value) async {
                                  Map<String, dynamic> userMap = {
                                    "nameSurname": _nameController.text,
                                  };
                                  await firestore
                                      .collection("users")
                                      .doc(value.user!.uid)
                                      .set(userMap);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const DashboardScreen())));
                                }).onError((error, stackTrace) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      error.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    action: SnackBarAction(
                                        textColor: darkColor,
                                        label: "Kapat",
                                        onPressed: () {}),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                });
                              }
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
