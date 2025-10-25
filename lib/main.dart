import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/pages/homepage.dart';
import 'package:flutter_quiz_app/pages/quizPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'montserratFont',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Quizpage(),
    );
  }
}
