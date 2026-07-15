import 'package:flutter/material.dart';
import '../../model/scores.dart';

class ScoreForm extends StatefulWidget{

  const ScoreForm({super.key});

  @override
  State<ScoreForm> createState() => _ScoreFormState();
}

class _ScoreFormState extends State<ScoreForm> {

  TextEditingController courseTitle = TextEditingController();
  TextEditingController scoreTitle = TextEditingController();

  void onSubmit() {

    final String title = courseTitle.text.trim();
    final String scoreText = scoreTitle.text.trim();
    final int score = int.parse(scoreText);

    ScoreInput input = ScoreInput(title: title, value: score);

    Navigator.pop(context, input);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form",
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: courseTitle,
                decoration: InputDecoration(
                  label: Text("Enter course: "),
                ),
              ),
              TextField(
                controller: scoreTitle,
                decoration: InputDecoration(
                  label: Text("Enter score: "),
                ),
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    TextButton(
                      onPressed: onSubmit, 
                      child: Text(
                        "Submit"
                      )
                    ),
                    SizedBox(width: 10,),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: Text(
                        "Cancel"
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}