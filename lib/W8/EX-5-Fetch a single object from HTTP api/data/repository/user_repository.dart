import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/user_model.dart';
import '../dto/user_dto.dart';

class UserRepository {

  Future<User> fetchUser() async {

    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

    // 1- Get the request response
    http.Response response = await http.get(url);

    // 2- Check the responsae status
    if (response.statusCode != 200) {
      throw FetchException('Failed to fetch products (HTTP ${response.statusCode})');
    }

    // 3- Parse the response
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