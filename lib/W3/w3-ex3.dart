import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(50)
                ),
              child: Center(
                child: Text(
                    "OOP",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 50
                    ),
                  ),
                ),
            ),
                
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(50)
                ),
              child: Center(
                child: Text(
                    "DART",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 50
                    ),
                  ),
                ),
            ),

            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentGeometry.centerLeft,
                  end: AlignmentGeometry.centerRight,
                  colors: [Colors.blue[300]!, const Color.fromARGB(255, 50, 0, 116)]
                  ),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(
                child: Text(
                    "FLUTTER",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 50
                    ),
                  ),
                ),
            )
          ]
        )
      )
    )
  );
}