import '../../model/user.dart';

class UserDto {

  static User fromJson(Map<String, dynamic> json){

    assert(json["id"] is String);
    assert(json["username"] is String);
    assert(json["exp"] is int);

    final String id = json["id"];
    final String username = json["username"];

    final int expiration = json["exp"];
    final DateTime expirationDate = DateTime.fromMillisecondsSinceEpoch(expiration * 1000);

    return User(id: id, username: username, expiration: expirationDate);

  }
}