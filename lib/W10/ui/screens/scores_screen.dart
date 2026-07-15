import 'package:flutter/material.dart';
import '../../model/scores.dart';

class ScoresScreen extends StatelessWidget{

  final VoidCallback onLogout;
  final String username;
  final List<Score> scoreList;

  const ScoresScreen({super.key, required this.onLogout, required this.scoreList, required this.username});

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
      
          return listTile(index);
      
        }
      ),
    );
  }

  Widget listTile(int index) {

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            scoreList[index].title,
            style: TextStyle(
              fontSize: 24
            ),
          ),
          Text(
            "${scoreList[index].value} / 100"
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 132, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 104, 74, 212),
        title: Text(
          "Welcome $username!!",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
            onPressed: onLogout, 
            icon: Icon(Icons.exit_to_app, color: Colors.white, size: 36,),
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        
        children: [
          SizedBox(height: 25,),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Container(
                  decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black)
                  )
                ),
                  child: IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.add_box_outlined, color: Colors.white, size: 36,)
                  ),
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.edit, color: Colors.white, size: 36,)
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.remove_circle_outline, color: Colors.white, size: 36,)
                ),
              ],
            ),
          ),
          SizedBox(height: 25,),
          content,
        ],
      ),
    );
  }


}