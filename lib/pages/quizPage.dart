import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/functions/getQuizQuestions.dart';
import 'package:flutter_quiz_app/widgets/resultQuestionCards.dart';

class Quizpage extends StatefulWidget {
  final Function(bool) isQuizHappening;
  final int numOfQuestions;
  const Quizpage({super.key, required this.isQuizHappening, required this.numOfQuestions});

  @override
  State<Quizpage> createState() => _QuizpageState();
}
class Question {
  final String question;
  final List<String> options;
  final String ans;
  Question({
    required this.question,
    required this.options,
    required this.ans
  });
}
class _QuizpageState extends State<Quizpage> {
  int currentQuestionNumber = 0;
  bool isLoading = true;
  List<Question> questions=[];
  List <String?> selectedOptions =[];
  void getData(int num)async{
    List<Question> q = await getAllDocuments("quizQuestions");
    List<Question> qToShow = [];
    for (var i = 0; i < num; i++) {
      q.shuffle();
      qToShow = q.sublist(0, num);
      Random();
    }
    setState(() {
      questions = qToShow;
      selectedOptions = List.filled(questions.length, null);
      isLoading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    getData(widget.numOfQuestions);
  }
  void nextQuestion() {
    if (selectedOptions[currentQuestionNumber]==null) {
      final snackBar = SnackBar(content: Text("Choose an option.", style: TextStyle(color: Colors.red),), behavior: SnackBarBehavior.floating,backgroundColor: Colors.white, duration: Duration(seconds: 3));
      ScaffoldMessenger.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    setState(() {
      currentQuestionNumber++;   
    });
  }
  void prevQuestion() {
    if (currentQuestionNumber==0) {
      return;
    }
    setState(() {
      currentQuestionNumber--;
      
    });
  }
  
  void answerSelection(String option) {

      selectedOptions[currentQuestionNumber]=option;
      nextQuestion();
  }
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Show a loading indicator
        ),
      );
    }

    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text("No quiz questions available."), // Handle empty state
        ),
      );
    }

    if (currentQuestionNumber==questions.length) {
      var correct=0;
      selectedOptions.asMap().forEach((index,k) {
       if (questions[index].ans==selectedOptions[index]) {
        correct++;
       }
      });
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,

            padding: EdgeInsets.all(20),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,

                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10,0,0),
                    height: 60,
                    child: Stack(
                  
                  children: [
                    Center(child: Text("Quiz Completed", style: TextStyle(fontSize: 21),)),
                    Positioned(
                      right: 20,
                      top: 1,
                      child: ElevatedButton(onPressed:(){
                        widget.isQuizHappening(false);
                      }, child: Icon(Icons.home)),)
                    
                  ],
                ),
                  )
                  
                )
                ,
                Text("Results:", style: TextStyle(fontSize: 20),),
                Text("Total: $correct/${questions.length}", style: TextStyle(fontSize: 20),),

                ...questions.asMap().entries.map((val) {
                  int index = val.key;
                  Question questionObj = val.value;
                  return Column(
                    children: [
                      Resultquestioncards(question: questionObj.question, ans: questionObj.ans, options: questionObj.options, selectedOption: selectedOptions[index])
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      );
    } else {
      Question currentQuestion = questions[currentQuestionNumber];
      return Scaffold(
      body: SingleChildScrollView(
        
        child: Container(
          height: MediaQuery.of(context).size.height,
        color: Colors.cyan,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20,0,20,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${currentQuestionNumber+1}/${questions.length}", style: TextStyle(fontSize: 30),),
            Text("Q${currentQuestionNumber+1}. ${currentQuestion.question}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
            SizedBox(height: 40,),
            Container(
              width: double.infinity,
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...currentQuestion.options.map((option){
                      return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(onPressed: (){
                      answerSelection(option);
                    },  style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOptions[currentQuestionNumber]==option?Colors.purpleAccent:Colors.white,
                      foregroundColor: selectedOptions[currentQuestionNumber]==option?Colors.white:Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),child: Text(option, style: TextStyle(fontSize: 15),),),
                  );
                  })
                  ,
                  
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: prevQuestion,  style: ElevatedButton.styleFrom(
                        fixedSize: Size(100, 40),
                        backgroundColor: currentQuestionNumber==0?Colors.white54:Colors.white,
                      ),child: Text("Back"),),
                      ElevatedButton(onPressed: nextQuestion,  style: ElevatedButton.styleFrom(
                        fixedSize: Size(100, 40)
                      ),child: currentQuestionNumber==questions.length-1?Text("End"):Text("Next"),),
                    ],
                  )
                  
                   ],
              ),
            )
          ],
        ),
      ),
    
      )
      );
  
    }
    }
}

