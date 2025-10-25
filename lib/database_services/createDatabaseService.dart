import 'dart:convert';

import 'package:flutter_quiz_app/scripts/addQuestionScript.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  final String tableName = "QuizQuestions";
  final String questionCol = "question";
  final String optionCol = "options";
  final String ansCol = "answer";
  static final DatabaseService instance = DatabaseService
      ._constructor(); // for singleton pattern.
  DatabaseService._constructor();

  // GETTER :
  Future<Database> get database async {
    if (_db!=null) {
    print("it should come here imo!!!!!");
      return _db!;};
    _db = await getDatabase();
    print(_db!);

    return _db!;
  }
  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();

    final databasePath = join(databaseDirPath, "quiz_db.db");

    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY,
        $questionCol TEXT NOT NULL,
        $optionCol TEXT NOT NULL,
        $ansCol TEXT NOT NULL
        )
        ''');
      },
    );
    return database;
  }


  // wont be used at runtime.
  Future<void> addQuestions(Question question)async {
    final db = await database;
    String stringifiedOptions = jsonEncode(question.options);
    await db.insert(tableName, {
      questionCol: question.question,
      optionCol: stringifiedOptions,
      ansCol: question.ans
    });
  }
}
