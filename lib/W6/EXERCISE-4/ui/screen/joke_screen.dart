import 'package:app_cadt/W6/EXERCISE-4/model/joke_model.dart';
import 'package:app_cadt/W6/EXERCISE-4/ui/screen/joke_card.dart';
import '../../data/joke_data.dart';
import 'joke_form.dart';
import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

class JokeScreen extends StatefulWidget {


  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {

  bool isBest = false;
  List <JokeModel> jokeData = [...jokes];

  void isBestChoosen(bool condition){

    setState(() {
      isBest = condition;
    });

  }

  void addJoke(JokeModel joke){

    setState(() {
      jokeData.add(joke);
    });

  }

  void showForm(){

    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (context) => JokeForm(submitJoke: addJoke,)
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
          actions: [
            IconButton(
              onPressed: showForm, 
              icon: Icon(Icons.add)
            ), 
            SizedBox(width: 20,)
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: jokeData.length,
                itemBuilder: (context, index){

                  return Dismissible(
                    key: ObjectKey(jokeData[index]),
                    background: Container(
                      color: Colors.red
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        jokeData.removeAt(index);
                      });
                    },
                    child: FavoriteCard(
                      jokeData: jokeData[index], 
                      isBestChoosen: isBestChoosen, 
                      isBest: isBest,
                    )
                  );

                },
              )
            )
          ],
        ),
      );
  }
}

