import 'package:app_cadt/W10/data/services/auth_services.dart';
import 'package:app_cadt/W10/ui/screens/authentication_screen.dart';
import 'package:app_cadt/W10/ui/screens/scores_screen.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget{
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  Widget get content {

    if (AuthenticationService.instance.session == null){

      return AuthenticationScreen(onLogIn: () {  
        setState(() {});
      },);

    }

    return ScoresScreen(
      onLogout: () {
        setState(() {});
      }
    );

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