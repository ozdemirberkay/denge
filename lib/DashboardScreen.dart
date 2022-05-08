import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denge/HomePage.dart';
import 'package:denge/QuizPage.dart';
import 'package:denge/auth/LoginPage.dart';
import 'package:denge/screen/Achievements.dart';
import 'package:denge/screen/RecordedPage.dart';
import 'package:denge/widget/DengeOutlinedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'utils/appColors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  int selectedIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String name = "";

  Future<void> getName() async {
    var snapshot =
        await firestore.collection("users").doc(auth.currentUser!.uid).get();
    Map<String, dynamic>? dataMap = snapshot.data();

    name = dataMap!["nameSurname"];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getName();
  }

  List<String> label = ["Kategoriler", "Quizler", "Kaydedilenler"];
  renderWidget() {
    if (selectedIndex == 0) {
      return HomePage();
    } else if (selectedIndex == 1) {
      return const QuizPage();
    } else if (selectedIndex == 2) {
      return const RecordedPage();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: lightColor,
      drawer: Drawer(
          child: Drawer(
        child: Container(
          color: lightColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: darkColor,
                ),
                child: Column(
                  children: [
                    const Expanded(
                        child: CircleAvatar(
                      radius: 60,
                      backgroundColor: lightColor,
                    )),
                    const SizedBox(height: 5),
                    Text(
                      name,
                      style: const TextStyle(color: lightColor, fontSize: 18),
                    ),
                  ],
                ),
              ),
              // DengeOutlinedButton(
              //   label: "Profil",
              //   icon: Icons.person,
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const Profile(),
              //         ));
              //     setState(() {
              //       selectedIndex = 0;
              //     });
              //     if (_scaffoldKey.currentState!.isDrawerOpen) {
              //       _scaffoldKey.currentState!.openEndDrawer();
              //     }
              //   },
              // ),
              DengeOutlinedButton(
                label: "Kaydedilenler",
                icon: Icons.bookmark,
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    selectedIndex = 2;
                  });
                },
              ),
              DengeOutlinedButton(
                label: "Başarılar",
                icon: Icons.quiz,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Achievements(),
                      ));
                  setState(() {
                    selectedIndex = 0;
                  });
                  if (_scaffoldKey.currentState!.isDrawerOpen) {
                    _scaffoldKey.currentState!.openEndDrawer();
                  }
                },
              ),
              DengeOutlinedButton(
                label: "Çıkış Yap",
                icon: Icons.logout,
                onPressed: () async {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      backgroundColor: lightColor,
                      title: const Text(
                        "Çıkış Yap",
                        style: TextStyle(color: Colors.black),
                      ),
                      content: const Text(
                        "Çıkış Yapmak istediğinize emin misiniz?",
                        style: TextStyle(color: darkColor),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () async {
                            await auth.signOut().then((value) async {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                  (route) => false);
                            });
                          },
                          child: const Text(
                            "Çıkış Yap",
                            style: TextStyle(color: darkColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            "Vazgeç",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: darkColor,
        ),
        centerTitle: true,
        title: Text(
          label[selectedIndex],
          style: const TextStyle(color: darkColor, fontSize: 27),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: renderWidget(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: darkColor,
        unselectedItemColor: darkColor.withOpacity(0.7),
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quizler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Kaydedilenler',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
