import 'package:flutter/material.dart';
import '../../model/user_model.dart';
import '../../data/repository/user_repository.dart';

class UserScreen extends StatefulWidget {

  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  AsyncState fetchState = AsyncState.notStarted;
  User? user;
  String error = "None";

  void isSelected() async {

  Map<String, dynamic> updatedData;

  if (user!.selected){
    updatedData = {
      "selected": false,
    };
  } else {
    updatedData = {
      "selected": true,
    };
  }

    bool success = await repository.patchUser(updatedData);

    if (success){

      setState(() {
        user!.selected = updatedData["selected"];
      });

    }
  }

  Widget button(){

    return GestureDetector(
      onTap: () => isSelected(),
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: user!.selected ? Colors.blue : Colors.grey[200],
        ),
        child: Text(
          user!.name
        ),
      ),
    );

  }

  Widget get content {

    switch (fetchState) {
      case AsyncState.notStarted:
        return Text("Tap on refresh to fetch user");
      case AsyncState.loading:
        return CircularProgressIndicator();
      case AsyncState.success:
        return button();
      case AsyncState.error:
        return Text("Unable to Fetch Data: $error");
    }
  }

  void fetchData() async {

    fetchState = AsyncState.loading;
    setState(() {});

    try {

      user = await repository.fetchUser();
      fetchState = AsyncState.success;
      setState(() {});

    } on FetchException catch (e){

      error = e.message ;
      fetchState = AsyncState.error;

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users"
        ),
        actions: [IconButton(onPressed: fetchData, icon: Icon(Icons.refresh))],
      ),
      body: Center(
        child: content,
      ),
    );
  }
}