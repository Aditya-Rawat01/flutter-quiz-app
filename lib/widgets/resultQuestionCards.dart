import 'package:flutter/material.dart';

class Resultquestioncards extends StatelessWidget {
  final String question;
  final List<String> options;
  final String ans;
  final String? selectedOption;
  const Resultquestioncards({super.key, required this.question, required this.ans, required this.options, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
      
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            Text(question),
            ...options.asMap().entries.map((entry){
              var option = entry.value;
              return 
              ElevatedButton(onPressed: (){}, style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(ans==option?Colors.white:(option==selectedOption?Colors.white:Colors.purple)),
                backgroundColor:WidgetStateProperty.all(ans==option?Colors.green:(option==selectedOption?Colors.red:Colors.white))
              ),child: Text(option));
            })
          ],
        ),
      ),
    )
    );
    
  }
}