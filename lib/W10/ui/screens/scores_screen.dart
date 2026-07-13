import 'package:flutter/material.dart';

class ScoresScreen extends StatelessWidget{

  final VoidCallback onLogout;

  const ScoresScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome!!"
        ),
      ),
      body: Column(
        children: [
          Center(
            child:  Text(
              "Hi Hi Hi Koala!!!",
            ),
          ),
          TextButton(
            onPressed: onLogout, 
            child: Text(
              "Logout"
            )
          )
        ],
      ),
    );
  }


}