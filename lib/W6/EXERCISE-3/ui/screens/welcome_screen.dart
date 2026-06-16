import 'package:app_cadt/W6/EXERCISE-3/ui/screens/temperature_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  void changeScreen(){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => TemperatureScreen(),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(
            Icons.thermostat_outlined,
            size: 120,
            color: Colors.white,
          ),
        ),
        const Text(
          "Welcome !",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
        const SizedBox(height: 15),
        OutlinedButton(
          onPressed: changeScreen,
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Colors.white)),
          child: Text('Start to convert',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              )),
        )
      ],
    ));
  }
}
