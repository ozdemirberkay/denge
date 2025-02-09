import 'package:denge/screen/HomePage.dart';
import 'package:denge/screen/RecordedPage.dart';
import 'package:flutter/material.dart';

import '../constants/appColors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  String name = "";
  String photoURL = "";

  @override
  void initState() {
    super.initState();
  }

  List<String> label = ["Kategoriler", "Kaydedilenler"];
  renderWidget() {
    if (selectedIndex == 0) {
      return const HomePage();
    } else if (selectedIndex == 1) {
      return const RecordedPage();
    }
    return Container();
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
