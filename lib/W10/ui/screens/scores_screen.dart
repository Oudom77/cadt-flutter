import 'package:flutter/material.dart';
import '../../model/scores.dart';

class ScoresScreen extends StatelessWidget{

  final VoidCallback onLogout;
  final List<Score> scoreList;

  const ScoresScreen({super.key, required this.onLogout, required this.scoreList});

  Widget get content {

    if (scoreList.isEmpty){

      return Center(
        child: Text(
          "No Score Available To Display",
          style: TextStyle(
            fontSize: 36
          ),
        ),
      );
    }
    

    return Expanded(
      child: ListView.builder(
        itemCount: scoreList.length,
        itemBuilder: (context, index){
      
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  scoreList[index].title
                ),
                Text(
                  "${scoreList[index].value}"
                )
              ],
            ),
          );
      
        }
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome!!"
        ),
        actions: [
          TextButton(
            onPressed: onLogout, 
            child: Text(
              "Logout"
            )
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        
        children: [
          content,
        ],
      ),
    );
  }


}