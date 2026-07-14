import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../model/user.dart';
import '../../model/auth_session.dart';
import '../dto/user_dto.dart';

class LoginException implements Exception{

  String? message;
  final int statusCode;

  LoginException({required this.statusCode}){

    if (statusCode == 401){

      message = "Invalid credentials";

    } else {

      message = "Connection lost, check your internet";

    }
  }
}


class AuthenticationService {

  static final AuthenticationService instance = AuthenticationService._(); //singleton instance
  final Uri urlBase = Uri.parse('http://localhost:3000');

  AuthSession? session; //shared session

  AuthenticationService._();

  Future<bool> login(String username, String password) async {

    Uri url = urlBase.replace(path: "login"); //find backend url

    Map<String, dynamic> loginJson = { //turn username and pw to json
      "username": username,
      "password": password,
    };

    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"}, //tell the backend this is a json
      body: jsonEncode(loginJson), //encode json into a json string
    );

    if (response.statusCode != 200){ //check for error

      throw LoginException(statusCode: response.statusCode);

    }

    Map<String, dynamic> json = jsonDecode(response.body); //returns a json {"token": alkdnfkalndfnaldnfalkjd}

    final String token = json["token"]; // token string

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token); // decode jwt payload
    
    final User user = UserDto.fromJson(decodedToken); // use the decoded payload to create User

    final DateTime expiration = user.expiration; // reuse user's expiration

    print("Response Body: $json\n\n Token String: $token\n\n Decoded JWT Payload: $decodedToken");

    session = AuthSession(
      user: user, 
      token: token,
      expiration: expiration
    );

    return true;
  }

  void logout(){

    session = null;

  }
}

// void main() async {

//   final success = await AuthenticationService.instance.login("john", "1234");
//   print(success);

// }