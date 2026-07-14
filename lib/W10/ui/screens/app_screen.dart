import '../../data/services/auth_services.dart';
import './authentication_screen.dart';
import './scores_screen.dart';
import 'package:flutter/material.dart';
import '../../model/scores.dart';
import '../../data/repositories/scores_repository.dart';
import '../utils/async_data.dart';

class AppScreen extends StatefulWidget{
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  final AuthenticationService _authService = AuthenticationService.instance;

  AsyncData<List<Score>> asyncState = AsyncData.notStarted();

  void _onLogout(){

    setState(() {
      asyncState = AsyncData.notStarted();
      _authService.logout();
    });

  }

  void _onLogin() async {

    final session = _authService.session; 

    if (session == null){ // check if session is valid

      return;

    }

    String token = session.token;
    try {

      setState(() {
        asyncState = AsyncData.loading();
      });

      List<Score> scoreList = await ScoresRepository().getScores(token); 

      setState(() {
        asyncState = AsyncData.success(scoreList);
      });

    } on Exception catch(e){

      setState(() {
        asyncState = AsyncData.error("$e");
      });
    }
  }

  Widget get content {

    switch(asyncState.status) {

      case AsyncStatus.notStarted:
        return AuthenticationScreen(onLogin: _onLogin);
        
      case AsyncStatus.loading:
        return CircularProgressIndicator();

      case AsyncStatus.success:
        return ScoresScreen(onLogout: _onLogout, scoreList: asyncState.value!);

      case AsyncStatus.error:
        return Scaffold(
          body: Center(
            child: Text(
              "Error No Wifi!!"
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}