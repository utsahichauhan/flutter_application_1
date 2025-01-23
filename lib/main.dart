import 'package:flutter/material.dart';
import 'package:flutter_application_1/welcome_screen.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz App",
      home: WelcomeScreen(),
    );
  }
}
