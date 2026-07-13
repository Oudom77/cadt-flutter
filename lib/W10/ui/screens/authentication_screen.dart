import 'package:flutter/material.dart';
import '../../data/services/auth_services.dart';

class AuthenticationScreen extends StatefulWidget{

  final VoidCallback onLogin;

  const AuthenticationScreen({super.key, required this.onLogin});


  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _usernameTitle = TextEditingController();
  final TextEditingController _passwordTitle = TextEditingController();

  @override
  void dispose() {
    _usernameTitle.dispose();
    _passwordTitle.dispose();
    super.dispose();
  }

  void _loginIsClicked() async {

    // Check if credentials are valid
    bool isSuccess = await AuthenticationService.instance.login(
      _usernameTitle.text,
      _passwordTitle.text,
    );

    // If valid login
    if (isSuccess) {

      widget.onLogin();

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
                        controller: _usernameTitle,
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
                        controller: _passwordTitle,
                        decoration: InputDecoration(labelText: "Password", border: InputBorder.none),
                        
                      ),
                    ),
                    SizedBox(height: 25,),
                    GestureDetector(
                      onTap: _loginIsClicked,
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