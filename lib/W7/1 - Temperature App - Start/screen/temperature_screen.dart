import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
 
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white)
  );
  
  TextEditingController tempController = TextEditingController();
  double? fahrenheit = 0;
  String displayMessage = "No result shown yet.";
  
  @override
  void dispose() {
    tempController.dispose();
    super.dispose();
  }

  void celciusToFahrenheit(String value){

    final trimmedValue = value.trim();

    setState(() {

      if (trimmedValue.isEmpty){

        fahrenheit = null;
        displayMessage = "No result shown yet.";
        return;

      }

      double? celsius = double.tryParse(trimmedValue);

      if (celsius != null){

        fahrenheit = ((celsius * 1.8) + 32);
        displayMessage = "${fahrenheit!.toStringAsFixed(2)} °F";

      } else {

        fahrenheit = null;
        displayMessage = "Invalid input!! Please enter a valid number";

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.thermostat_outlined,
            size: 120,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 45),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Temperature in Degrees:"),
          const SizedBox(height: 10),

          TextField(
            controller: tempController,
            decoration: inputDecoration,
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              celciusToFahrenheit(value);
            },
          ),

          const SizedBox(height: 30),
          const Text("Temperature in Fahrenheit:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                displayMessage,
                style: TextStyle(
                  color: (fahrenheit != null) ? Colors.black : Colors.red
                ),
              ))
        ],
      )),
    );
  }
}
