import '../../model/user_model.dart';

class UserDto {

  static final String nameKey = "name";
  static final String selectedKey = "selected";

  static User fromJson(Map<String, dynamic> json){

    assert(json[nameKey] is String);
    assert(json[selectedKey] is bool);

    String name = json[nameKey];
    bool selected = json[selectedKey];

    return User(name: name, selected: selected);

  }

}