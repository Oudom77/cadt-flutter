import 'package:flutter/material.dart';

class MyHobbies extends StatelessWidget{

  final String title;
  final IconData icon;
  final Color background;

  const MyHobbies({
    super.key, 
    required this.title, 
    required this.icon,
    this.background = Colors.blue, 
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(right: 30, left: 20, top: 40, bottom: 40),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              )
            )
          ],
        )
      ),
    );
  }
}


void main(){

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Hobbies"
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsetsGeometry.all(40),
          decoration: BoxDecoration(
            color: Colors.grey[400]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyHobbies(title: "Travelling", icon: Icons.place, background: Colors.green,),
              MyHobbies(title: "Skating", icon: Icons.skateboarding, background: Colors.grey,),
            ],
          ),
        ),
      )
    )
  );
}