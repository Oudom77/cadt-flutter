import 'package:app_cadt/W8/EX-5-Fetch%20a%20single%20object%20from%20HTTP%20api/ui/user_tile.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../data/repository/user_repository.dart';

class UserScreen extends StatefulWidget{

  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  AsyncState fetchState = AsyncState.notStarted;

  User? user;

  String? error;

  Widget get content {
    switch (fetchState) {
      case AsyncState.notStarted:
        return Text("Tap on refresh to fetch user");

      case AsyncState.loading:
        return CircularProgressIndicator();

      case AsyncState.success:
        return UserTile(user: user!);

      case AsyncState.error:
        return Text(error!, style: TextStyle(color: Colors.red));
    }
  }

  void fetchData() async {
    fetchState = AsyncState.loading;
    setState(() {}); // refresh the view

    try {
      user = await repository.fetchUser();
      fetchState = AsyncState.success;
      setState(() {}); // refresh the view
    } on FetchException catch (e) {
      error = e.message;

      fetchState = AsyncState.error;
      setState(() {}); // refresh the view
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User"
        ),
        actions: [
          IconButton(onPressed: fetchData, icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .start,
          children: [
            content,
          ],
        )
      ),
    );
  }
}