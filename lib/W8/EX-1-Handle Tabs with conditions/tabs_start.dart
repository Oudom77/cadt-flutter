import 'package:flutter/material.dart';
import 'model/tabs_model.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("Red Screen")),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("Blue Screen")),
    );
  }
}

class App extends StatefulWidget {

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  AppTabs currentScreen = AppTabs.red;

  Widget get content {
    switch (currentScreen){
      case (AppTabs.red):
        return RedScreen();
      case AppTabs.green:
        return GreenScreen();
      case AppTabs.blue:
        return BlueScreen();
    }
  }

  Widget homeButton({required AppTabs tab}){

    return IconButton(
      onPressed: (){
        setState(() {
          currentScreen = tab;
        });
      }, 
      icon: Icon(
        Icons.home,
        color: tab.color,
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tabs navigation")),
      body: content,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            homeButton(tab: AppTabs.red),
            homeButton(tab: AppTabs.blue),
            homeButton(tab: AppTabs.green),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}
