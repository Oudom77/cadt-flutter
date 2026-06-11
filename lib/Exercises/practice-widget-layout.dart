import 'package:flutter/material.dart';


class ProfileApp extends StatelessWidget {

  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36
              ),
            ),
          ),
          backgroundColor: Colors.teal,
          toolbarHeight: 80,
          actions: [Icon(Icons.menu), SizedBox(width: 20,)],
          leading: Icon(Icons.person_pin),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 432,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.teal)
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 76,
                          backgroundImage: AssetImage("assets/w5-ex3/girl.jpg"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            "Flower Girl",
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.teal
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                            "Cambodian Flowerist",
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.teal
                            ),
                          ),
                        ),
                        Divider(color: Colors.teal,),
                        Expanded(
                          child: Container(
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: .spaceEvenly,
                                crossAxisAlignment: .stretch,
                                children: [
                                  Column(
                                    mainAxisAlignment: .center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10, right: 5),
                                        child: Text(
                                          "42",
                                          style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.teal
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10, right: 5),
                                        child: Text(
                                          "Post",
                                          style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.teal
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(),
                                  Column(
                                    mainAxisAlignment: .center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10, right: 5),
                                        child: Text(
                                          "1.2k",
                                          style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.teal
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5, right: 10),
                                        child: Text(
                                          "Followers",
                                          style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.teal
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(),
                                  Column(
                                    mainAxisAlignment: .center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10, right: 5),
                                        child: Text(
                                          "310",
                                          style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.teal
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5, right: 10),
                                        child: Text(
                                          "Following",
                                          style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.teal
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          height: 150,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 55, 201, 186),
          ),
          child: Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal
                ),
                child: Center(
                  child: Text(
                    "Message",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal
                ),
                child: Center(
                  child: Text(
                    "Follow",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal
                ),
                child: Center(
                  child: Text(
                    "Share",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      )
    );
  }

}

class LayoutApp extends StatelessWidget {

  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 60,
              color: Colors.blue,
            ),
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      padding: EdgeInsets.all(8),
                      child: Container(
                        color: const Color.fromARGB(255, 107, 177, 109),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.purple,
                          ),
                        ),
                        Container(
                          height: 8,
                          color: Colors.orange[900],
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.green[900],
                            ),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Container(
                              color: Colors.green[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 8,
              color: Colors.grey,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: const Color.fromARGB(255, 204, 192, 23),
                            padding: EdgeInsets.all(16),
                            child: Container(
                              color: const Color.fromARGB(255, 111, 36, 161),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.teal,
                                ),
                              ),
                              Container(
                                width: 4,
                                color: Colors.black,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.teal,
                                ),
                              ),
                              Container(
                                width: 4,
                                color: Colors.black,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.teal,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.teal,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.amber,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}


void main(){

  runApp(
    ProfileApp()
  );
}