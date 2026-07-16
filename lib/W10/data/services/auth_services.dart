import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../model/user.dart';
import '../../model/auth_session.dart';
import '../dto/user_dto.dart';

class LoginException implements Exception{

  late final String message;
  final int statusCode;

  LoginException({required this.statusCode}){

    switch(statusCode){

      case 401:
        message = "Invalid credentials";
      default:
        message = "Login failed";

    }
  }
}


class AuthenticationService {

  static final AuthenticationService instance = AuthenticationService._(); //singleton instance
  final Uri urlBase = Uri.parse('http://localhost:3000');
  
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String _tokenKey = 'auth_token';

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

    await jwtDecode(token: token, sessionCheck: false);

    return true;
  }

  Future<void> logout() async {

    session = null;
    await _storage.delete(key: _tokenKey);

  }

  Future<bool> restoreSession() async{

    final String? token  = await _storage.read(key: _tokenKey); //check for token
    

    if (token != null){ // if exist check expiration

      try {

        final bool isExpired = JwtDecoder.isExpired(token);

        if (isExpired){ // if expired, delete token

          session = null;
          await _storage.delete(key: _tokenKey);
          return false;

        }

        await jwtDecode(token: token, sessionCheck: true);

      return true;

      } catch(e) { // if any erros, null-session and delete token

        session = null;
        await _storage.delete(key: _tokenKey);
        return false;

      }
    }

    return false; // if token don't exist
  }

  Future<void> jwtDecode({required String token, required bool sessionCheck}) async {

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token); // decode jwt payload
    
    final User user = UserDto.fromJson(decodedToken); // use the decoded payload to create User

    if (!sessionCheck){

      await _storage.write(
        key: _tokenKey, 
        value: token
      );
    }

    final DateTime expiration = user.expiration; // reuse user's expiration

    print("Response Body: $json\n\n Token String: $token\n\n Decoded JWT Payload: $decodedToken");

    session = AuthSession(
      user: user, 
      token: token,
      expiration: expiration
    );

  }

}



// void main() async {

//   final success = await AuthenticationService.instance.login("john", "1234");
//   print(success);

// }