import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: const Center(
            child: Text(
              "Hi How Are You?",
              style: TextStyle(color: Colors.orange, fontSize: 50),
            ),
          ),
        ),
      ),
    ),
  );    
}