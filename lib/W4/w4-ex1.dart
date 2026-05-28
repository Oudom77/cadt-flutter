import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Column(
        children: [
          Container(
              height: 100,
              color: Colors.white,
          ),
          Container(
              height: 400,
              color: Colors.cyan[900],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Container(
                  color: Colors.pink,
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 20,
                height: 100,
                child: Container(
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 20,
                height: 100,
                child: Container(
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Container(
            height: 20,
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              color: Colors.pink
            ),
          )
        ],
      ),
    ),
  );
}


