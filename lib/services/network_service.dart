import 'dart:convert';

import 'package:http/http.dart';
import 'package:learn_http/models/movie.dart';

sealed class Network {
  static const String baseUrl = "dummyapi.online";

  static const apiMovies = "/api/movies";

  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  static Future<String?> methodGet({required String api, int? id, Map<String, String> headers = headers}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
      final response = await get(url, headers: headers);
      if(response.statusCode == 200) {
        return response.body;
      }
    } catch(e) {
      return null;
    }
  }

  static List<Movie> parseMovieList(String data) {
    final json = jsonDecode(data) as List; /// String => json(Map, List, ...)
    return json.map((item) => Movie.fromJson(item)).toList(); /// json => object
  }

  static Movie parseMovie(String data) {
    final json = jsonDecode(data);
    final movie = Movie.fromJson(json);
    return movie;
  }
}