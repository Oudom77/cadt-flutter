import 'package:flutter/material.dart';
import 'ui/screens/user_screen.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'data/repository/user_repository.dart';
// import 'model/user_model.dart';

void main () async {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserScreen(),
  ));

}