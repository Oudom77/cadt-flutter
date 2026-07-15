import 'package:app_cadt/W10/data/dto/scores_dto.dart';
import 'package:app_cadt/W10/data/services/auth_services.dart';
import 'package:app_cadt/W10/model/scores.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScoresRepository {

  final Uri baseUrl = Uri.parse("http://localhost:3000");

  Future<List<Score>> getScores(String token) async {

    final Uri scoreUrl = baseUrl.replace(path: "scores");

    final http.Response response = await http.get(
      scoreUrl,
      headers: {
        "Authorization": "Bearer $token",
      }
    );

    if (response.statusCode != 200){

      throw Exception("Status Code: ${response.statusCode}\nResponse Body: ${response.body}");

    }

    final List<dynamic> json = jsonDecode(response.body);

    final List<Score> scoreList = [];

    for (final scoreJson in json){

      final decodedJson = Map<String, dynamic>.from(scoreJson); // not rlly needed, putting it for fun :p
      Score score = ScoreDto.fromJson(decodedJson);
      scoreList.add(score);
      
    }

    print(scoreList);
    
    return [...scoreList];

  }

  Future<Score> createScore(String token, ScoreInput input) async {

    final Uri scoreUrl = baseUrl.replace(path: "scores");

    final Map<String, dynamic> scoreInput = {
      "title": input.title,
      "value": input.value,
    };

    final http.Response response = await http.post(
      scoreUrl,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(scoreInput)
    );

    if (response.statusCode != 201){

      throw Exception("Status Code: ${response.statusCode}");

    }

    final Map<String, dynamic> json = jsonDecode(response.body);

    final Score score = ScoreDto.fromJson(json);

    return score;

  }

  Future<void> updateScore() async {

    throw Exception();

  }

  Future<void> deleteScore() async {

    throw Exception();

  }

}

// void main() async {

//   ScoresRepository instance = ScoresRepository();
//   List<Score> score = await instance.getScores("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjAwMSIsIm5hbWUiOiJKb2huIiwidXNlcm5hbWUiOiJqb2huIiwicm9sZSI6InN0dWRlbnQiLCJpYXQiOjE3ODM5NjUwMTksImV4cCI6MTc4Mzk2NTEzOX0.Cr4EtX_v0MP0-HJpjYPsuHWPc4DNFfsz7C0ntKT4f6k");
//   print(score);
// }