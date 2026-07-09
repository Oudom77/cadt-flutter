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
  AsyncState updateState = AsyncState.notStarted;

  User? user;
  String fetchError = "";
  String updateError = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void isSelected() async {

    final updateSelected = !user!.selected;

    setState(() {
      updateState = AsyncState.loading;
    });

    try {

      await repository.patchUser({"selected": updateSelected});
      setState(() {
        user!.selected = updateSelected;
        updateState = AsyncState.success;
      });

    } on FetchException catch (e){

      setState(() {
        updateError = e.message;
        updateState = AsyncState.error;
      });

    }
  }

  Widget get buttonContent {

    switch(updateState) {
      case AsyncState.notStarted:
        return Text(user!.name);
      case AsyncState.loading:
        return CircularProgressIndicator();
      case AsyncState.success:
        return Text(user!.name);
      case AsyncState.error:
        return Text(updateError);
    }

  }

  Widget button(){

    return GestureDetector(
      onTap: () => isSelected(),
      child: Container(
        width: 150,
        height: 150,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: user!.selected ? Colors.blue[500] : Colors.grey[200],
        ),
        child: Center(child: buttonContent)
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
        return Text("Unable to Fetch Data: $fetchError");
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

      fetchError = e.message ;
      fetchState = AsyncState.error;
      setState(() {});

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
