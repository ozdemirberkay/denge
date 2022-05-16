import 'package:denge/DashboardScreen.dart';
import 'package:denge/auth/FirstPage.dart';
import 'package:denge/model/word_model.dart';
import 'package:denge/utils/appColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter("dengewords");
  Hive.registerAdapter(DengeWordAdapter());
  await Hive.openBox<DengeWord>("word");
  await Hive.openBox("achievements");
  var box = Hive.box("achievements");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DENGE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: darkColor,
              displayColor: darkColor,
            ),
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? const FirstPage()
          : const DashboardScreen(),
    );
  }
}
