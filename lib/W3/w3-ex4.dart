import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Space"),
          centerTitle: false,
          backgroundColor: Colors.white,
          toolbarHeight: 75,
          leading: Icon(Icons.arrow_back),
          actions: [Icon(Icons.menu), SizedBox(width: 20)]
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Welcome Message
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 20),
              child: Column(
                children: [
                  Container(
                    alignment: AlignmentGeometry.centerLeft,
                    color: Colors.white,
                    child: Text(
                      "Hello World",
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      "Lets organize your space.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildCard('Storage', Icons.folder),
                  buildCard('Photos', Icons.folder)
                ],
              ),
            ),
            // Row 2
            Expanded(
              child: Row(
                children: [
                  buildCard("Songs", Icons.folder),
                  buildCard('Videos', Icons.folder)
                ],
              ),
            ),
            // Row 3
            Expanded(
              child: Row(
                children: [
                  buildCard('Trash', Icons.delete),
                  buildCard('Others', Icons.add_box)
                ],
              ),
            ),
            // Row 4 - Setting
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 92, 159, 214),
              ),
              
              child: Center(
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize g: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ),
    ),
  );
}


Widget buildCard(String text, IconData icon ){

return Expanded(
    child: Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 92, 159, 214),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            right: 16,
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Icon(
                  icon,
                  size: 70,
                  color: const Color.fromARGB(255, 255, 236, 67),
                )
              ),
              Container(
                padding: EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),
                ),
              )
            ]
          )
        ],
      ),
    ),
  );
}