import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
        padding: EdgeInsets.all(40),
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
                    onPressed: () {},
                    child: Text("5"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 40),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("10"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 40),
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("20"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 40),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
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
                      Positioned(child: Text("Start"),height: 20,width: 50, left: 30,),
                      Positioned(child: Icon(Icons.arrow_right, size: 20),right: 15,),
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
