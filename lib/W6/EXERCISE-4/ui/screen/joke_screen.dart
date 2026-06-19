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

  int isFavoriteIndex = -1;

  List <JokeModel> jokeData = [...jokes];

  void isFavorite(int index){

    setState(() {
      isFavoriteIndex = (isFavoriteIndex == index) ? -1 : index;
    });

  }

  Widget showCard({required int index, required JokeModel jokeData}){

    if (isFavoriteIndex == index){

      return FavoriteCard(jokeData: jokeData, isFavorite: true, id: index, changeFavorite: isFavorite,);

    }

    return FavoriteCard(jokeData: jokeData, isFavorite: false, id: index, changeFavorite: isFavorite,);

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
                    secondaryBackground: Container(
                      color: Colors.green,
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        jokeData.removeAt(index);
                        isFavoriteIndex = (isFavoriteIndex == index) ? -1 : isFavoriteIndex;
                      });
                    },
                    child: showCard(index: index, jokeData: jokeData[index])
                  );

                },
              )
            )
          ],
        ),
      );
  }
}

