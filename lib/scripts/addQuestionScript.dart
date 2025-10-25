// import 'dart:convert';

// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter_quiz_app/database_services/createDatabaseService.dart';
// import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
class Question {
  final String question;
  final List<String> options;
  final String ans;
  Question({required this.question, required this.options, required this.ans});
}

// Future<void> addQuestionsFn() async {
//   final DatabaseService _db = DatabaseService.instance;
//   final String jsonString = await rootBundle.loadString('questions.json');
//   final List<dynamic> questionMaps = jsonDecode(jsonString);

//   List<Future<void>> insertionFutures = [];

//   for (final map in questionMaps) {
//     Question question = Question(
//       question: map['question'] as String,
//       options: (map['options'] as List<dynamic>).cast<String>(),
//       ans: map['answer'] as String, 
//     );

//     insertionFutures.add(_db.addQuestions(question));
//   }

//   await Future.wait(insertionFutures);
//   print("Question Added successfully");
// }


// void main()async{
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     databaseFactory = databaseFactoryFfiWeb;
//   } 
  
//   await addQuestionsFn();
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(body: Center(child: Text("this is bulsshit"))),
//     );
//   }
// }
