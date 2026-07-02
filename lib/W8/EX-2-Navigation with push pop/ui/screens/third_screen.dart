import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  void homeScreen (BuildContext context) {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Third Screen'),
             
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Second Screen'),
            ),

            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () => homeScreen(context),
              child: const Text('Back to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}