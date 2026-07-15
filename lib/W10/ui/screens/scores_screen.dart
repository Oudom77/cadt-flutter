import 'package:flutter/material.dart';
import '../../model/scores.dart';
import './score_form.dart';

class ScoresScreen extends StatefulWidget{

  final VoidCallback onLogout;
  final Future<void> Function(ScoreInput) onSubmit;
  final String username;
  final List<Score> scoreList;

  const ScoresScreen({super.key, required this.onLogout, required this.scoreList, required this.username, required this.onSubmit});

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  Widget get content {

    if (widget.scoreList.isEmpty){

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
        itemCount: widget.scoreList.length,
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
            widget.scoreList[index].title,
            style: TextStyle(
              fontSize: 24
            ),
          ),
          Text(
            "${widget.scoreList[index].value} / 100"
          )
        ],
      ),
    );
  }

  void _createForm() async {

    final ScoreInput? scoreInput = await Navigator.push(
      context, 
      MaterialPageRoute(builder: 
        (context) => ScoreForm()
      )
    );

    if (scoreInput == null){
      return;
    }
    print("returned from form");

    print(scoreInput);

    await widget.onSubmit(scoreInput);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 132, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 104, 74, 212),
        title: Text(
          "Welcome ${widget.username}!!",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
            onPressed: widget.onLogout, 
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
                    onPressed: _createForm, 
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