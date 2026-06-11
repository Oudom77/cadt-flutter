import 'dart:math';
import 'package:flutter/material.dart';

const List dices = [
  "assets/dices/dice-1.png",
  "assets/dices/dice-2.png",
  "assets/dices/dice-3.png",
  "assets/dices/dice-4.png",
  "assets/dices/dice-5.png",
  "assets/dices/dice-6.png"
];

String activeDice = dices[Random().nextInt(6)];

class Dice extends StatefulWidget {

  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  void rollDice(){
    
    setState(() {
      activeDice = dices[Random().nextInt(6)];
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.purple,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: rollDice,
                child: Image.asset(activeDice)
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: rollDice,
                child: const Text(
                  "Roll Dice",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}


void main(){
  runApp(
    MaterialApp(
      home: Dice(),
    )
  );
}