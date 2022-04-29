import 'package:denge/DashboardScreen.dart';
import 'package:denge/auth/SignupPage.dart';
import 'package:denge/utils/appColors.dart';
import 'package:denge/widget/DengeButton.dart';
import 'package:denge/widget/DengeInput.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "berk@ay.com");
    _passwordController = TextEditingController(text: "12345678");
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DengeButton(
                            label: "Giriş Yap",
                            onPressed: () {
                              bool _validate =
                                  _formKey.currentState!.validate();
                              if (_validate) {
                                auth
                                    .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                )
                                    .then((value) {
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
