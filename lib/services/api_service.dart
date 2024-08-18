import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/models/webtoon_datail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        var wtInstance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(wtInstance);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDatailModel> getToonbyId(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var webtoonDetailJson = jsonDecode(response.body);
      var webtoonDetailInstance =
          WebtoonDatailModel.fromJson(webtoonDetailJson);
      return webtoonDetailInstance;
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestWebtoonbyId(
      String id) async {
    List<WebtoonEpisodeModel> webtoonEpiInstance = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var episodes = jsonDecode(response.body);
      for (var epi in episodes) {
        webtoonEpiInstance.add(WebtoonEpisodeModel.fromJson(epi));
      }
      return webtoonEpiInstance;
    }
    throw Error();
  }
}
