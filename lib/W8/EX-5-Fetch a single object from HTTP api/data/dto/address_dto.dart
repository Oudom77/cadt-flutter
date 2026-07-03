import '../../model/user_model.dart';
import './geo_dto.dart';

class AddressDto {

  static final String streetKey = "street";
  static final String suiteKey = "suite";
  static final String cityKey = "city";
  static final String zipcodeKey = "zipcode";
  static final String geoKey = "geo";

  static Address fromJson(Map<String, dynamic> json){

  assert(json[streetKey] is String);
  assert(json[suiteKey] is String);
  assert(json[cityKey] is String);
  assert(json[zipcodeKey] is String);
  assert(json[geoKey] is Map<String, dynamic>);

  String street = json[streetKey];
  String suite = json[suiteKey];
  String city = json[cityKey];
  String zipcode = json[zipcodeKey];
  Geo geo = GeoDto.fromJson(json[geoKey]);

  return Address(street: street, suite: suite, city: city, zipcode: zipcode, geo: geo);

  }
}