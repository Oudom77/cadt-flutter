import 'package:app_cadt/W10/data/services/auth_services.dart';
import './authentication_screen.dart';
import './scores_screen.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget{
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  final AuthenticationService _authService = AuthenticationService.instance;

  void onLogOut(){

    setState(() {
      _authService.session = null;
    });

  }

  void onLogIn(){

    setState(() {
      
    });

  }

  Widget get content {

    if (AuthenticationService.instance.session == null){

      return AuthenticationScreen(onLogIn: onLogIn);

    }

    return ScoresScreen(onLogOut: onLogOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: content,
      ),
    );
  }
}