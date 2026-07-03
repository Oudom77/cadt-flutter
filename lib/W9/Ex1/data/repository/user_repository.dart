import 'package:http/http.dart' as http;
import 'dart:convert';
import '../dto/user_dto.dart';
import '../../model/user_model.dart';

class UserRepository {

  Future<bool> patchUser(Map<String, dynamic> updatedData) async {

    Uri url = Uri.parse("https://cadt-flutter-default-rtdb.asia-southeast1.firebasedatabase.app/w9/users/001.json");

    http.Response response = await http.patch(
      url,
      body: jsonEncode(updatedData),
    );

    return (response.statusCode == 200);

  }

  Future<User> fetchUser() async {

    Uri url = Uri.parse("https://cadt-flutter-default-rtdb.asia-southeast1.firebasedatabase.app/w9/users/001.json");

    http.Response response = await http.get(url);

    if (response.statusCode != 200){

      throw FetchException("Error - status code: ${response.statusCode}");

    }


    Map<String, dynamic> json = jsonDecode(response.body);

    User user = UserDto.fromJson(json);

    return user;

  }

}

class FetchException implements Exception{

  final String message;

  const FetchException(this.message);

}

UserRepository repository = UserRepository();