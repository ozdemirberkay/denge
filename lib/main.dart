import 'package:denge/screen/DashboardScreen.dart';
import 'package:denge/model/word_model.dart';
import 'package:denge/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter("dengewords");
  Hive.registerAdapter(DengeWordAdapter());
  await Hive.openBox<DengeWord>("word");
  runApp(const DengeApp());
}

class DengeApp extends StatefulWidget {
  const DengeApp({super.key});

  @override
  State<DengeApp> createState() => _DengeAppState();
}

class _DengeAppState extends State<DengeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Denge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: darkColor,
              displayColor: darkColor,
            ),
      ),
      home: const DashboardScreen(),
    );
  }
}
