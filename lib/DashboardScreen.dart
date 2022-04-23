import 'package:denge/HomePage.dart';
import 'package:denge/widget/DengeButton.dart';
import 'package:denge/widget/DengeOutlinedButton.dart';
import 'package:flutter/material.dart';

import 'utils/appColors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  List<String> label = ["Kategoriler", "Quizler", "Kaydedilenler"];
  renderWidget() {
    if (selectedIndex == 0) {
      return HomePage();
    } else if (selectedIndex == 1) {
      return Container();
    } else if (selectedIndex == 2) {
      return Container();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  children: const [
                    Expanded(
                        child: CircleAvatar(
                      radius: 60,
                      backgroundColor: lightColor,
                    )),
                    SizedBox(height: 5),
                    Text(
                      "Berkay Özdemir",
                      style: TextStyle(color: lightColor, fontSize: 18),
                    ),
                  ],
                ),
              ),
              DengeOutlinedButton(
                label: "Profil",
                icon: Icons.person,
                onPressed: () {},
              ),
              DengeOutlinedButton(
                label: "Kaydedilenler",
                icon: Icons.bookmark,
                onPressed: () {},
              ),
              DengeOutlinedButton(
                label: "Quiz Başarıları",
                icon: Icons.quiz,
                onPressed: () {},
              ),
              DengeOutlinedButton(
                label: "Çıkış Yap",
                icon: Icons.logout,
                onPressed: () {},
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
