import 'package:flutter/material.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigation Demo',
      home: HomeScreen(),
    );
  }
}

void secondScreen (BuildContext context) {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SecondScreen()),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Home Screen'),
            ElevatedButton(
              onPressed: () => secondScreen(context),
              child: const Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
 