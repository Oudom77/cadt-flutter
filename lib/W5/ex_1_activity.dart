import 'package:flutter/material.dart';

// List<String> colors = ["red", "blue", "green"];

List<ColorLabel> colors = [ColorLabel.red, ColorLabel.blue, ColorLabel.green];

enum ColorLabel{
  red(color: Colors.red),
  blue(color: Colors.blue),
  green(color: Colors.green);

  final Color color;
  const ColorLabel({required this.color});
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Label("Method 1: Loop in Array", bold: true),
              // TODO
              for (ColorLabel col in colors) Text("Color ${col.name}", style: TextStyle(color: col.color),),
              SizedBox(height: 20,),

              Label("Method 2: Map", bold: true),
              // TODO
              ...colors.map((col) => Text(col.name, style: TextStyle(color: col.color),)).toList(),
              SizedBox(height: 20,),

              Label("Method 3: Dedicated Function", bold: true),
              // TODO
              ...getLabels(),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

List<Widget> getLabels(){

  return colors.map((col) => Text(col.name, style: TextStyle(color: col.color),)).toList();

}
