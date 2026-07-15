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

  AsyncData<List<Score>> asyncState = AsyncData.loading();

  @override
  void initState() {
    super.initState();
    _initSession();
  }

  Future<void> _initSession() async {

    try {

      final bool restoreSuccess = await _authService.restoreSession();

      if (!mounted){ // Checks if the current state is displayed, or closed
        return;
      }

      if (restoreSuccess){

        await _onLogin();

      } else {

        setState(() {
          asyncState = AsyncData.notStarted();
        });

      }

    } catch (e){

      if (!mounted){ // Checks if the current state is displayed, or closed
        return;
      }

      setState(() {
        asyncState = AsyncData.error("$e");
      });

    }
  }

  Future<void> _onLogout() async {

    await _authService.logout(); // await in order to wait for secure storage to delete token

    if (!mounted){ // Checks if the current state is displayed
      return;
    }

    setState(() {
      asyncState = AsyncData.notStarted();
    });

  }

  Future<void> _onLogin() async {

    final session = _authService.session; 

    if (session == null){ // check if session is valid

      return;

    }

    final String token = session.token;

    try {

      setState(() {
        asyncState = AsyncData.loading();
      });

      List<Score> scoreList = await ScoresRepository().getScores(token); 

      if (!mounted){ // Checks if the current state is displayed after fetching score
        return;
      }

      setState(() {
        asyncState = AsyncData.success(scoreList);
      });

    } on Exception catch(e){

      if (!mounted){ // Checks if the current state is displayed after error
        return;
      }

      setState(() {
        asyncState = AsyncData.error("$e");
      });
    }
  }

  Future<void> _onSubmit(ScoreInput input) async {

    try {

      final List<Score> newList = asyncState.value!;

      setState(() {
        asyncState = AsyncData.loading();
      });

      final Score score = await ScoresRepository().createScore(_authService.session!.token, input);

      if (!mounted){
        return;
      }

      newList.add(score);
      
      setState(() {
        asyncState = AsyncData.success(newList);
      });

    } catch (e){

      if (!mounted){
        return;
      }

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
        return ScoresScreen(
          onLogout: _onLogout, 
          scoreList: asyncState.value!, 
          username: _authService.session!.user.username, 
          onSubmit: _onSubmit,
        );

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