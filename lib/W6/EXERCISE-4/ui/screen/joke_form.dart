import 'package:flutter/material.dart';
import '../../model/joke_model.dart';

class JokeForm extends StatefulWidget {

  final Function(JokeModel) submitJoke;

  const JokeForm({super.key, required this.submitJoke});

  @override
  State<JokeForm> createState() => _JokeFormState();
}

class _JokeFormState extends State<JokeForm> {

  TextEditingController titleController = TextEditingController();
  TextEditingController jokeController = TextEditingController();
  TextEditingController punchlineController = TextEditingController();
  String enteredTitle = "";
  String enteredJoke = "";
  String enteredPunchline = "";

  @override
  void dispose() {
    titleController.dispose();
    jokeController.dispose();
    punchlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void closeForm(){

        Navigator.pop(context);

    }

    void submitForm(){

      final JokeModel joke = JokeModel(
        title: enteredTitle, 
        joke: enteredJoke, 
        punchline: enteredPunchline
      );

      if (joke.title == "" || joke.joke == "" || joke.punchline == ""){

        return;

      }

      widget.submitJoke(joke);
      closeForm();

    }

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          TextField(
            onChanged: (value) {
              
              setState(() {
                enteredTitle = titleController.text.trim();
              });

            },
            controller: titleController,
            decoration: InputDecoration(label: Text("Enter The Joke's Title: ")),
          ),
          TextField(
            onChanged: (value) {
              
              setState(() {
                enteredJoke = jokeController.text.trim();
              });

            },
            controller: jokeController,
            decoration: InputDecoration(label: Text("Enter The Joke : ")),
          ),
          TextField(
            onChanged: (value) {
              
              setState(() {
                enteredPunchline = punchlineController.text.trim();
              });

            },
            controller: punchlineController,
            decoration: InputDecoration(label: Text("Enter The Punchline: ")),
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: .center,
            children: [
              ElevatedButton(
                onPressed: submitForm, 
                child: Text(
                  "Submit"
                )
              ),
              SizedBox(width: 50,),
              ElevatedButton(
                onPressed: closeForm, 
                child: Text(
                  "Close"
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}