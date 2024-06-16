import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_local_storage_hive/pages/homePage.dart';

void main() async {
  await Hive.initFlutter();
  var newBox = await Hive.openBox('newBox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple,
        primary: Colors.purple,
        secondary: Colors.purple[300],
      )),
      home: const Homepage(),
    );
  }
}
