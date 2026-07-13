import './scores_screen.dart';
import 'package:flutter/material.dart';
import '../../data/services/auth_services.dart';

class AuthenticationScreen extends StatefulWidget{

  final VoidCallback onLogIn;

  const AuthenticationScreen({super.key, required this.onLogIn});


  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  TextEditingController usernameTitle = TextEditingController();
  TextEditingController passwordTitle = TextEditingController();

  void loginIsClicked() async {

    bool isSuccess = await AuthenticationService.instance.login(
      usernameTitle.text,
      passwordTitle.text,
    );

    if (isSuccess) {

      widget.onLogIn();

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  'assets/w10/login-bg-hd.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[600]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: usernameTitle,
                        decoration: InputDecoration(labelText: "Email/Username", border: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[600]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: passwordTitle,
                        decoration: InputDecoration(labelText: "Password", border: InputBorder.none),
                        
                      ),
                    ),
                    SizedBox(height: 25,),
                    GestureDetector(
                      onTap: () => {
                        loginIsClicked(), 
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        height: 75,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[600]!),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 71, 20, 192),
                        ),
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}