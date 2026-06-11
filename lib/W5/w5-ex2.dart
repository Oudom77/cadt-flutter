import 'package:flutter/material.dart';



class FavoriteApp extends StatelessWidget {

const FavoriteApp({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Favorite Cards"
          ),
          backgroundColor: Colors.blue[500],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              FavoriteCard(title: 'Flutter', description: 'Coding With Flutter'),
              SizedBox(height: 20,),
              FavoriteCard(title: 'Dart', description: 'Coding With Dart'),
              SizedBox(height: 20,),
              FavoriteCard(title: 'Javascript', description: 'Coding With Javascript')
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteCard extends StatefulWidget {

  final String title;
  final String description;

  const FavoriteCard({super.key, required this.title, required this.description});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {

  bool isFav = false;

  void favoriteCheck(){

    setState(() {
      if (isFav){
        isFav = false;
      } else {
        isFav = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 33, 150, 243),
                          ),
                        ),
                        Text(
                          widget.description
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: favoriteCheck, 
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                icon: Icon(
                  isFav? Icons.favorite : Icons.favorite_border_outlined,
                  color: isFav? Colors.red : Colors.grey,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

void main(){

  runApp(
    FavoriteApp()
  );

}