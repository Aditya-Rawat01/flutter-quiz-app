import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/widgets/resultQuestionCards.dart';

class Quizpage extends StatefulWidget {
  final Function(bool) isQuizHappening;
  const Quizpage({super.key, required this.isQuizHappening});

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
  List<Question> questions = [
    Question(question: "How many teeths does the great white baloon shark shrimplets with no teeth but big feets and large belly but no food but still carnivore, creates oxygen and consumes carbon dioxide, still doesnt breathe and live under the water but suffocates due to lack of oxygen under the water, has hands but cannot swim as it can suffocate under the water.", options: ["hello","no","i have a bf", "chopped"], ans: "chopped"),
    Question(question: "How many teeths does the great white baloon shark shrimplets with no teeth but big feets and large belly but no food but still carnivore, creates oxygen and consumes carbon dioxide, still doesnt breathe and live under the water but suffocates due to lack of oxygen under the water, has hands but cannot swim as it can suffocate under the water.", options: ["hello","no","i have a bf", "chopped"], ans: "chopped"),
    Question(question: "How many teeths does the great white baloon shark shrimplets with no teeth but big feets and large belly but no food but still carnivore, creates oxygen and consumes carbon dioxide, still doesnt breathe and live under the water but suffocates due to lack of oxygen under the water, has hands but cannot swim as it can suffocate under the water.", options: ["hello","no","i have a bf", "chopped"], ans: "chopped"),
    Question(question: "How many teeths does the great white baloon shark shrimplets with no teeth but big feets and large belly but no food but still carnivore, creates oxygen and consumes carbon dioxide, still doesnt breathe and live under the water but suffocates due to lack of oxygen under the water, has hands but cannot swim as it can suffocate under the water.", options: ["hello","no","i have a bf", "chopped"], ans: "chopped"),
    Question(question: "How many teeths does the great white baloon shark shrimplets with no teeth but big feets and large belly but no food but still carnivore, creates oxygen and consumes carbon dioxide, still doesnt breathe and live under the water but suffocates due to lack of oxygen under the water, has hands but cannot swim as it can suffocate under the water.", options: ["hello","no","i have a bf", "chopped"], ans: "chopped"),
    ];
  List <String?> selectedOptions =[];
  @override
  void initState() {
    super.initState();
    selectedOptions = List.filled(questions.length, null);
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

                  child: Stack(
                  
                  children: [
                    Center(child: Text("Quiz Completed", style: TextStyle(fontSize: 25),)),
                    Positioned(
                      right: 20,
                      top: 1,
                      child: ElevatedButton(onPressed:(){
                        widget.isQuizHappening(false);
                      }, child: Icon(Icons.home)),)
                    
                  ],
                ),
                )
                ,
                Text("Results:", style: TextStyle(fontSize: 20),),
                Text("Total: $correct/${questions.length}"),

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
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${currentQuestionNumber+1}/${questions.length}", style: TextStyle(fontSize: 30),),
            Text("Q${currentQuestionNumber+1}. ${currentQuestion.question}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
            SizedBox(height: 40,),
            Container(
              width: double.infinity,
              child: Column(
                spacing: 25,
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
                    height: 50,
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

