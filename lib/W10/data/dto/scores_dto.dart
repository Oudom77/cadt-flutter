import '../../model/scores.dart';

class ScoreDto {

  static Score fromJson(Map<String, dynamic> json){

    assert(json["id"] is String);
    assert(json["title"] is String);
    assert(json["value"] is int);

    final String id = json["id"];
    final String title = json["title"];
    final int value = json["value"];

    return Score(id: id, title: title, value: value);

  }
}