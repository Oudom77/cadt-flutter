import 'package:app_cadt/W6/EXERCISE-3-States/ui/screens/byebye.dart';
import 'package:app_cadt/W6/EXERCISE-3-States/ui/screens/temperature_screen.dart';
import 'model/screen_model.dart';
import 'package:flutter/material.dart';

import 'ui/screens/welcome_screen.dart';


class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {

  Screens currentScreen = Screens.welcome;



  Widget get content{
    switch(currentScreen) {
      case Screens.welcome:
        return WelcomeScreen(onStartPressed: onStartPressed,);

      case Screens.converter:
         return TemperatureScreen(onBackPressed: onBackPressed, onByeByePressed: onByeByePressed,);
         
      case Screens.bye:
        return ByeBye(onBackPressed: onBackPressed,);
    }    
  }

  void onStartPressed( ){
    setState(() {
      currentScreen = Screens.converter;
    });
  } 

  void onBackPressed( ){
    setState(() {
      if (currentScreen == Screens.converter){

        currentScreen = Screens.welcome;

      } else if (currentScreen == Screens.bye){

        currentScreen = Screens.converter;

      }
    });
  } 

  void onByeByePressed (){

    setState(() {
      currentScreen = Screens.bye;
    });

  }

  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: content
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
