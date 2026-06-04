import 'package:flutter/material.dart';

enum IconPosition {

  left("left"),
  right("right");

  final String pos;
  const IconPosition(this.pos);

}

enum ButtonType {

  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
  const ButtonType(this.color);

}

class CustomButton extends StatelessWidget{

  final String label;
  final IconData icon;
  final IconPosition position;
  final ButtonType type;

  const CustomButton({
    super.key, 
    required this.label, 
    required this.icon,
    this.position = IconPosition.left,
    this.type = ButtonType.primary, 
    });

  @override
  Widget build(BuildContext context) {
    if (position == IconPosition.left){

      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: type.color,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(width: 10,),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
    } else {

      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: type.color,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10,),
            Icon(icon),
          ],
        ),
      );
    }
  }
}


void main(){

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Custom Buttons"
          ),
        ),
        body: Container(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: "Submit", icon: Icons.check),
              CustomButton(label: "Time", icon: Icons.access_alarms_sharp, type: ButtonType.secondary, position: IconPosition.right,),
              CustomButton(label: "Account", icon: Icons.account_circle, type: ButtonType.disabled, position: IconPosition.right,)
            ],
          ),
        ),
      )
    )
  );
}