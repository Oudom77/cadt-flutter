import 'package:flutter/material.dart';
import '../../data/joke_data.dart';
import '../../model/joke_model.dart';

Color appColor = Colors.green[300] as Color;


class FavoriteCard extends StatefulWidget {

  final JokeModel jokeData;
  final bool isBest;
  final Function(bool) isBestChoosen;

  const FavoriteCard({
    super.key,
    required this.jokeData, required this.isBestChoosen, required this.isBest
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  
  bool _isFavorite = false; // Checks for the card
  bool isClicked = false; // Checks to show the card details


  void onFavoriteClick() {

    setState(() {

      if (widget.isBest && !(_isFavorite)){

        return;

      } else {

        _isFavorite = !_isFavorite;
        widget.isBestChoosen(_isFavorite);

      }
    });
  }

  void showDetails(){

    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.jokeData.title,
                style: TextStyle(
                  fontSize: 48
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 50, bottom: 50),
              child: Text(
                widget.jokeData.joke,
                style: TextStyle(
                  fontSize: 24
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 50, bottom: 50),
              child: Text(
                widget.jokeData.punchline,
                style: TextStyle(
                  fontSize: 24
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )
    );
  }
 
  @override
  Widget build(BuildContext context) {

    final jokeData = widget.jokeData;
    
    
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      height: 200,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            isClicked = !isClicked;
          });
        },        
        child: Container(
          padding: EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    jokeData.title,
                    style: TextStyle(
                      fontSize: 24
                    ),
                  ), 
                  Text(
                    isClicked ? "${jokeData.joke}\n${jokeData.punchline}" : jokeData.joke
                  )
                ],
              ),
              Column(
                mainAxisAlignment: .spaceBetween,
                children: [
                  IconButton(
                    onPressed: onFavoriteClick,
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? Colors.red : Colors.grey,
                    )
                  ),
                  IconButton(
                    onPressed: showDetails,
                    icon: Icon(Icons.menu_open)
                  )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}