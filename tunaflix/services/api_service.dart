import 'dart:convert';

import 'package:http/http.dart' as http; // install via 'flutter pub add http' on terminal
import 'package:tunaflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebToonModel>> getTodaysToons() async {
    List<WebToonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); // wait until loaded
    // Future tells which type of data will be got later ex. Future<Response> => a data of Response
    // Every async functions return Future type

    if(response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);
      for(var webtoon in webtoons) {
        webtoonInstances.add(WebToonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }



}