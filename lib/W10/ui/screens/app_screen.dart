import '../../data/services/auth_services.dart';
import './authentication_screen.dart';
import './scores_screen.dart';
import 'package:flutter/material.dart';
import '../../model/scores.dart';
import '../../data/repositories/scores_repository.dart';

class AppScreen extends StatefulWidget{
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  final AuthenticationService _authService = AuthenticationService.instance;

  List<Score>currentList = [];

  void _onLogout(){

    setState(() {
      _authService.logout();
    });

  }

  void _onLogin() async {

    final session = _authService.session; 

    if (session == null){ // check if session is valid

      return;

    }

    String token = session.token;
    List<Score> scoreList = await ScoresRepository().getScores(token); 

    setState(() {
      currentList = scoreList;
    });

  }

  Widget get content {

    // Display screens based on if session exist (logged in)
    if (_authService.session == null){

      return AuthenticationScreen(onLogin: _onLogin);

    }

    return ScoresScreen(onLogout: _onLogout, scoreList: currentList);
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}