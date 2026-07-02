import '../../model/user_model.dart';

class UserDto {

    static final String nameKey = "name";
    static final String emailKey = "email";
    static final String websiteKey = "website";


    static User fromJson(Map<String, dynamic> json){

    assert(json[nameKey] is String);
    assert(json[emailKey] is String);
    assert(json[websiteKey] is String);

    String name = json[nameKey];
    String email = json[emailKey];
    String website = json[websiteKey];

    return User(name: name, email: email, website: website);
  }
}