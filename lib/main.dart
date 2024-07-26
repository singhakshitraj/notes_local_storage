import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_local_storage_hive/pages/homePage.dart';
import 'package:google_fonts/google_fonts.dart';

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
          textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow,
            primary: Colors.yellow[500],
            secondary: Colors.yellow[300],
          )),
      home: const Homepage(),
    );
  }
}
