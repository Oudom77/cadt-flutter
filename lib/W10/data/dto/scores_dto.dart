import '../../model/scores.dart';

class ScoreDto {

  static Score fromJson(Map<String, dynamic> json){

    assert(json["title"] is String);
    assert(json["value"] is int);

    final String title = json["title"];
    final int value = json["value"];

    return Score(title: title, value: value);

  }
}