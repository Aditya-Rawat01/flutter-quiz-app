import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/pages/homepage.dart';
import 'package:flutter_quiz_app/pages/quizPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  State<MainApp> createState() => _startQuiz();
}

class _startQuiz extends State<MainApp> {
  bool isQuiz = false;
  int numOfQuestions = 5;
  void isQuizHappening(bool value) {
    setState(() {
      isQuiz=value;
    });
  }
  void setQuestions(int value) {
    setState(() {
      numOfQuestions = value;
    });
  }
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
      home: isQuiz?Quizpage(
        isQuizHappening:isQuizHappening
      ):Homepage(
        isQuiz:isQuiz,
        isQuizHappening:isQuizHappening,
        numOfQuestions:numOfQuestions,
        setQuestions:setQuestions
      ),
    );
  }
}
