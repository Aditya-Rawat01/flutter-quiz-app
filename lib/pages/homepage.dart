import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Homepage extends StatefulWidget {
  final bool isQuiz;
  final int numOfQuestions;
  final Function(int) setQuestions;
  final Function(bool) isQuizHappening;
  const Homepage({super.key, required this.isQuiz, required this.isQuizHappening, required this.numOfQuestions, required this.setQuestions});
  State<Homepage> createState() => _HomeState();
}

class _HomeState extends State<Homepage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,

            children: [
              Text(
                "Quizzie App",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Icon(Icons.quiz_rounded),
            ],
          ),
        ),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/clouds.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: ClipRRect(
              
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white54, width: 4)
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    "Fancy a quiz?",
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text("Take a quiz right now for educational purposes."),
                  SizedBox(height: 100),
                  Text("Select no. of Questions:"),
                  ElevatedButton(

                    onPressed: (){
                      widget.setQuestions(5);
                    },
                    child: Text("5"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 40),
                      backgroundColor: widget.numOfQuestions==5?Colors.green:Colors.white,
                      foregroundColor: widget.numOfQuestions==5?Colors.white:Colors.purple,
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.setQuestions(10);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 40),
                      backgroundColor: widget.numOfQuestions==10?Colors.deepOrange:Colors.white,
                      foregroundColor: widget.numOfQuestions==10?Colors.white:Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text("10"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(onPressed: (){
                    widget.isQuizHappening(true);

                  },style: ElevatedButton.styleFrom(
                    
                      fixedSize: Size(150, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.center,
                    children:[
                      Positioned(height: 20,width: 50, left: 30,child: Text("Start"),),
                      Positioned(right: 15,child: Icon(Icons.arrow_right, size: 20),),
                      ])
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
