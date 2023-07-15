import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_http/models/harry_potter.dart' hide User, Geo;
import 'package:learn_http/models/movie.dart';
import 'package:learn_http/models/users.dart' show User;

/// as - bu kutubxonani bitta nom bilan o'zgaruvchi kabi ishlatish uchun foydalanadi
/// hide - bu kutubxona yoki file ichidagi biz belgilagan elementni kutubxona chaqirilgan joyda ko'rsatmaydi, yashiradi.
/// show - bu kutubxona yoki file ichidagi biz belgilagan elementnigina chaqirilgan joyda ishlatishga ruxsat beradi

sealed class Network {
  static const String baseUrl = "dummyapi.online";
  static const String baseUrlHarryPotter = "hp-api.onrender.com";
  static const String baseUrlUsers = "642ce05cbf8cbecdb4f8cec2.mockapi.io";

  static const apiMovies = "/api/movies";
  static const apiHarryAllCharacters = "/api/characters";
  static const apiHarryOneCharacter = "/api/character"; // ID
  static const users = "/api/v2/users";

  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  static Future<String?> methodGet({required String api, Object? id, Map<String, String> headers = headers, String baseUrl = baseUrl}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
      final response = await http.get(url, headers: headers);
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

  static List<Character> parseCharacterList(String data) {
    final json = jsonDecode(data) as List; /// String => json(Map, List, ...)
    return json.map((item) => Character.fromJson(item)).toList(); /// json => object
  }

  static List<User> parseUserList(String data) {
    final json = jsonDecode(data) as List; /// String => json(Map, List, ...)
    return json.map((item) => User.fromJson(item)).toList(); /// json => object
  }
}