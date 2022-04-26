import 'package:denge/utils/appColors.dart';
import 'package:denge/widget/DengeButton.dart';
import 'package:denge/widget/DengeInput.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
          "Profil",
          style: TextStyle(color: darkColor, fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        const SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height / 10),
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
        Expanded(child: Container()),
        DengeInput(
          labelText: "İsim Soyisim",
          controller: _nameController,
          suffixIcon: Icons.person,
        ),
        const SizedBox(height: 20),
        DengeInput(
          labelText: "E-mail",
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
        Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DengeButton(
              label: "Kaydet",
              onPressed: () {},
            )),
        Expanded(child: Container()),
      ]),
    );
  }
}
