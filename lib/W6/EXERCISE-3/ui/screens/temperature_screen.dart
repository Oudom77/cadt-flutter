import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  double input = 0;

  void celciusToFarenheit(String value){

    setState(() {
      input = ((int.parse(value) * 1.8) + 32);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40.0),
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
                onChanged: (value) {
                  celciusToFarenheit(value);
                },
                decoration: inputDecoration,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 30),
              const Text("Temperature in Fahrenheit:"),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${input.toStringAsFixed(2)} °F"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
