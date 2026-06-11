import 'package:flutter/material.dart';

Color background = Colors.blue[50]!;
Color textColor = Colors.black;
String buttonText = "Not Selected";

class ButtonApp extends StatelessWidget {

  const ButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                CustomButtons(),
                SizedBox(height: 20,),
                CustomButtons(),
                SizedBox(height: 20,),
                CustomButtons(),
                SizedBox(height: 20,),
                CustomButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtons extends StatefulWidget{

  const CustomButtons({super.key});

  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {

  bool isClicked = false;

  void changeColor() {

    setState(() {

      if (!isClicked){

        background = Colors.blue[500]!;
        buttonText = "Selected";
        textColor = Colors.white;
        isClicked = true;

      } else {

        background = Colors.blue[50]!;
        buttonText = "Not Selected";
        textColor = Colors.black;
        isClicked = false;

      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: changeColor,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 36,
            color: textColor,
          ),
        ),
      )
    );
  }
}

void main(){

  runApp(
    ButtonApp(),
  );
}
