import 'package:flutter/material.dart';
import '../../model/scores.dart';

class UpdateForm extends StatefulWidget{

  const UpdateForm({super.key});

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {

  TextEditingController courseTitle = TextEditingController();
  TextEditingController scoreTitle = TextEditingController();
  String? errorTitle;
  String? errorScore;

  void onSubmit() {

    final String title = courseTitle.text.trim();
    final String scoreText = scoreTitle.text.trim();
    final int? score = int.tryParse(scoreText);

    setState(() {
      if (title.isEmpty){
        errorTitle = "Course is required";
      } else {
        errorTitle = null;
      }

      if (scoreText.isEmpty){
          errorScore = "Score is required";
      } else if (score == null){
          errorScore = "Score needs to be a number";
      } else if (score <= 0 || score > 100){
          errorScore = "Score needs to be between 1 - 100";
      } else {
        errorScore = null;
      }
    });

    if (errorScore != null || errorTitle != null){

      return;

    }

    final ScoreInput input = ScoreInput(title: title, value: score!);
    Navigator.pop(context, input);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Form",
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
                  errorText: errorTitle
                ),
              ),
              TextField(
                controller: scoreTitle,
                decoration: InputDecoration(
                  label: Text("Enter score: "),
                  errorText: errorScore
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