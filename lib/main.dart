import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/firebase_options.dart';
import 'package:flutter_quiz_app/functions/getQuizQuestions.dart';
import 'package:flutter_quiz_app/pages/homepage.dart';
import 'package:flutter_quiz_app/pages/quizPage.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => StartQuiz();
}

class StartQuiz extends State<MainApp>{
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
        isQuizHappening:isQuizHappening,
        numOfQuestions:numOfQuestions
      ):Homepage(
        isQuiz:isQuiz,
        isQuizHappening:isQuizHappening,
        numOfQuestions:numOfQuestions,
        setQuestions:setQuestions
      ),
    );
  }
}
