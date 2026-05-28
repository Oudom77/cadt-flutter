import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(40.0),
            padding: const EdgeInsets.all(50.0),
            color:  Colors.lightBlue,
            width: 1920.0,
            height: 1080.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Center(
                child: Text(
                  "CADT STUDENTS", 
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 50,
                    decoration: TextDecoration.none
                    ),
                  ),
              ),
            )
          )
        )
      )
    )
  );
}