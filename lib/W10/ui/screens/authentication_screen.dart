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
  String? usernameError;
  String? passwordError;
  String? _loginError;

  @override
  void dispose() {
    _usernameTitle.dispose();
    _passwordTitle.dispose();
    super.dispose();
  }

  void _validateUsername(String value){

    final String username = value.trim();

    setState(() {
      usernameError = (username.isEmpty) ? "Empty username" : null;
    });

  }

  void _validatePassword(String value){

    final String password = value.trim();

    setState(() {
      passwordError = (password.isEmpty) ? "Empty password" : null;
    });

  }

  bool _validateInputs(){

    final String password = _passwordTitle.text.trim();
    final String username = _usernameTitle.text.trim();

    setState(() {
      usernameError = (username.isEmpty) ? "Empty username" : null;
      passwordError = (password.isEmpty) ? "Empty password" : null;
    });

    bool isValidated = (password.isNotEmpty && username.isNotEmpty) ? true : false;

    return isValidated;

  }

  void _loginIsClicked() async {

    _loginError = null;

    if (_validateInputs() == false){

      return;

    }

    // Check if credentials are valid
    try {

      bool isSuccess = await AuthenticationService.instance.login(
      _usernameTitle.text,
      _passwordTitle.text,
      );

      // If valid login
      if (isSuccess) {

        widget.onLogin();

      }

    } on LoginException catch(e){

      setState(() {
        _loginError = e.message;
      });

    }

  }

  Widget get errorMessage {

    if (_loginError != null){

      return Center(
        child: Text(
          "$_loginError",
          style: TextStyle(
            fontSize: 24,
            color: Colors.red,
          ),
        )
      );
    } else {

      return SizedBox(height: 15,);

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
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[600]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          _validateUsername(value);
                        },
                        controller: _usernameTitle,
                        decoration: InputDecoration(
                          labelText: "Email/Username", 
                          errorText: usernameError,
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[600]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        onChanged: (value) {
                            _validatePassword(value);
                        },
                        controller: _passwordTitle,
                        decoration: InputDecoration(
                          labelText: "Password", 
                          errorText: passwordError,
                          border: InputBorder.none
                        ),
                        
                      ),
                    ),
                    errorMessage,
                    SizedBox(height: 10,),
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