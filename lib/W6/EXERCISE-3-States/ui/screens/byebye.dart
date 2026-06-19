import 'package:flutter/material.dart';

class ByeBye extends StatefulWidget {

  final VoidCallback onBackPressed;

  const ByeBye({super.key, required this.onBackPressed});

  @override
  State<ByeBye> createState() => _ByeByeState();
}

class _ByeByeState extends State<ByeBye> {

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
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const Text(
          "Bye Bye",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 50,
          ),
        ),
        const SizedBox(height: 15),
        OutlinedButton(
          onPressed: widget.onBackPressed,
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Color.fromARGB(255, 255, 255, 255))),
          child: Text('Go Back To Converter',
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 15,
              )),
        )
      ],
    ));
  }
}