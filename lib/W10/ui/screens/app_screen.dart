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

  void _onLogout(){

    setState(() {
      _authService.logout();
    });

  }

  void _onLogin(){

    setState(() {});

  }

  Widget get content {

    if (_authService.session == null){

      return AuthenticationScreen(onLogin: _onLogin);

    }

    return ScoresScreen(onLogout: _onLogout);
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}