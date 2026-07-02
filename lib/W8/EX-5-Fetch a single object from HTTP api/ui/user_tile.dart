import 'package:flutter/material.dart';
 
import '../model/user_model.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});

  final User user;
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          border: Border(
            bottom: BorderSide(color: Colors.black)
          )
        ),
        child: ListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
          trailing: Text(user.website),
        ),
      ),
    );
  }
}
