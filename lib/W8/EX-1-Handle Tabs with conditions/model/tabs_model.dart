import 'package:flutter/material.dart';

enum AppTabs { 
  red(color: Colors.red), 
  green(color: Colors.green), 
  blue(color: Colors.blue);

  final Color color;

  const AppTabs({required this.color});
}
