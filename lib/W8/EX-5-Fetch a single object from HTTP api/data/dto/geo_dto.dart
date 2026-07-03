import '../../model/user_model.dart';

class GeoDto {

  static final String latKey = "lat";
  static final String lngKey = "lng";

  static Geo fromJson(Map<String, dynamic> json){

    assert(json[latKey] is String);
    assert(json[lngKey] is String);

    double lat = double.parse(json[latKey]);
    double lng = double.parse(json[lngKey]);

    return Geo(lat: lat, lng: lng);

  }

}