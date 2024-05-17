import 'dart:convert';


import 'package:http/http.dart';

import '../model/animemodel.dart';
import 'api _client.dart';






class AnimeApi {
  ApiClient apiClient = ApiClient();


  Future<Anime> getAnime() async {
    String trendingpath = 'https://anime-db.p.rapidapi.com/anime?page=1&size=10&search=Fullmetal&sortBy=ranking&sortOrder=asc&genres=Fantasy,Drama';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Anime.fromJson(jsonDecode(response.body));
  }
}