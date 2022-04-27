import 'package:denge/DashboardScreen.dart';
import 'package:denge/auth/LoginPage.dart';
import 'package:denge/utils/appColors.dart';
import 'package:flutter/material.dart';

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
                            return "İsminiz 3 harften kısa olamaz";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      DengeInput(
                        labelText: "Email",
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      DengeInput(
                        labelText: "Şifre",
                        controller: _passwordController,
                        obscureText: true,
                        suffixIcon: Icons.lock,
                      ),
                      const SizedBox(height: 20),
                      DengeInput(
                        labelText: "Şifre Tekrar",
                        controller: _passwordAgainController,
                        obscureText: true,
                        suffixIcon: Icons.lock,
                      ),
                      const SizedBox(height: 20),
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DengeButton(
                            label: "Kayıt Ol",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const DashboardScreen())));
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
