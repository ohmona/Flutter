import 'dart:convert';

import 'package:http/http.dart' as http; // install via 'flutter pub add http' on terminal
import 'package:tunaflix/models/webtoon_detail_model.dart';
import 'package:tunaflix/models/webtoon_episodes_model.dart';
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

  static Future<WebtoonDetailModel> getToonById(String id) async{
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if(response.statusCode == 200)
    {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(String id) async{
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if(response.statusCode == 200)
    {
      final episodes = jsonDecode(response.body);
      for(var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }

}