import 'package:flutter/material.dart';
import '../screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  void thirdScreen (BuildContext context) {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ThirdScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Second Screen'),

             ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home Screen'),
            ),

            SizedBox(height: 20,),
             
            ElevatedButton(
              onPressed: () => thirdScreen(context),
              child: const Text('Go to Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}