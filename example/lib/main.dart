import 'package:example/pages/home_page.dart';
import 'package:example/pages/manual_page1.dart';
import 'package:example/pages/manual_page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        "manual1": (context) => const ManualPage1(),
        "manual2": (context) => const ManualPage2(),
      },
    );
  }
}
