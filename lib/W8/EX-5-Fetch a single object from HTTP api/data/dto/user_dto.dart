import '../../model/user_model.dart';
import './address_dto.dart';

class UserDto {

    static final String nameKey = "name";
    static final String emailKey = "email";
    static final String websiteKey = "website";
    static final String addressKey = "address";


    static User fromJson(Map<String, dynamic> json){

    assert(json[nameKey] is String);
    assert(json[emailKey] is String);
    assert(json[websiteKey] is String);
    assert(json[addressKey] is Map<String, dynamic>);

    String name = json[nameKey];
    String email = json[emailKey];
    String website = json[websiteKey];
    Address address = AddressDto.fromJson(json[addressKey]);

    return User(name: name, email: email, website: website, address: address);
  }
}



