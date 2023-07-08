import 'dart:convert';

import 'package:learn_http/models/movie.dart';
import 'package:learn_http/services/network_service.dart';
import 'package:test/test.dart';
/// unit test
void main() async {
  group("Network service", () {
    test("Snapshot1. Testing methodGet and apiMovies", () async {
      await Network.methodGet(api: Network.apiMovies).then((data) {
        print(data);
      });
    });

    test("Snapshot2. Testing methodGet and apiMovies", () async {
      final data = await Network.methodGet(api: Network.apiMovies);
      // expect(data, isNotNull);
      expect(data, equals("""[{"id":1,"movie":"The Shawshank Redemption","rating":9.2,"image":"images/shawshank.jpg","imdb_url":"https://www.imdb.com/title/tt0111161/"},{"id":2,"movie":"The Godfather","rating":9.2,"image":"images/godfather.jpg","imdb_url":"https://www.imdb.com/title/tt0068646/"},{"id":3,"movie":"The Dark Knight","rating":9,"image":"images/dark_knight.jpg","imdb_url":"https://www.imdb.com/title/tt0468569/"},{"id":4,"movie":"Pulp Fiction","rating":8.9,"image":"images/pulp_fiction.jpg","imdb_url":"https://www.imdb.com/title/tt0110912/"},{"id":5,"movie":"The Lord of the Rings: The Return of the King","rating":9,"image":"images/lotr_return_king.jpg","imdb_url":"https://www.imdb.com/title/tt0167260/"},{"id":6,"movie":"The Good, the Bad and the Ugly","rating":8.8,"image":"images/good_bad_ugly.jpg","imdb_url":"https://www.imdb.com/title/tt0060196/"},{"id":7,"movie":"Fight Club","rating":8.8,"image":"images/fight_club.jpg","imdb_url":"https://www.imdb.com/title/tt0137523/"},{"id":8,"movie":"The Lord of the Rings: The Fellowship of the Ring","rating":8.8,"image":"images/lotr_fellowship.jpg","imdb_url":"https://www.imdb.com/title/tt0120737/"},{"id":9,"movie":"Forrest Gump","rating":8.8,"image":"images/forrest_gump.jpg","imdb_url":"https://www.imdb.com/title/tt0109830/"},{"id":10,"movie":"Inception","rating":8.8,"image":"images/inception.jpg","imdb_url":"https://www.imdb.com/title/tt1375666/"}]"""));
    });

    test("Snapshot 3. Testing Movie.fromJson", () async {
      /// string json:
      final data = await Network.methodGet(api: Network.apiMovies, id: 1);
      print("Data: $data");

      /// map json - real json:
      final json = jsonDecode(data!);

      /// object:
      final movie = Movie.fromJson(json);
      print("Parse Object: $movie");
      expect(movie, const TypeMatcher<Movie>());
    });

    test("Snapshot 4. Network.parseMovieList", () async {
      final data = await Network.methodGet(api: Network.apiMovies);
      List<Movie> list = Network.parseMovieList(data!);
      print(list);

      expect(list.length, 10);
    });
  });
}