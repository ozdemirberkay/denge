import 'package:denge/auth/InitScreen.dart';
import 'package:denge/model/word_model.dart';
import 'package:denge/utils/appColors.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: darkColor,
              displayColor: darkColor,
            ),
      ),
      home: const InitScreen(),
    );
  }
}
