import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:test/test.dart';
import 'package:learn_http/models/harry_potter.dart';
import 'package:learn_http/services/network_service.dart';

void main() {
  group("Harry Potter API test", () {

    /// All
    test("Test: getMethod: api/characters ", () async {
      final response = await Network.methodGet(baseUrl: Network.baseUrlHarryPotter, api: Network.apiHarryAllCharacters);
      debugPrint(response);
      expect(response, isNotNull);
    });

    test("Test: Character.fromJson => All", () async {
      final response = await Network.methodGet(baseUrl: Network.baseUrlHarryPotter, api: Network.apiHarryAllCharacters);
      /// String => List<Map> => List<Character>
      
      /// String => List<Map>
      final json = jsonDecode(response!) as List; /// List<Map>
      
      /// List<Map> => List<Character>
      final list = json.map((item) => Character.fromJson(item as Map<String, Object?>)).toList();
      
      expect(list, hasLength(json.length));
    });



    /// One
    test("Test: getMethod: api/character/:id ", () async {
      final response = await Network.methodGet(baseUrl: Network.baseUrlHarryPotter, api: Network.apiHarryOneCharacter, id: "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8");
      debugPrint(response);
      expect(response, isNotNull);
    });

    test("Test: Character.fromJson => One", () async {
      final response = await Network.methodGet(baseUrl: Network.baseUrlHarryPotter, api: Network.apiHarryOneCharacter, id: "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8");
      debugPrint(response);
      final json = jsonDecode(response!); // json => List<Map> => json.first => Map
      final character = Character.fromJson(json.first);
      expect(character, const TypeMatcher<Character>());
    });

    /// Parsing
    test("Test: Network.parseCharacterList One", () async {
      final response = await Network.methodGet(baseUrl: Network.baseUrlHarryPotter, api: Network.apiHarryOneCharacter, id: "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8");
      List<Character> list = Network.parseCharacterList(response!);
      expect(list.first, const TypeMatcher<Character>());
    });

    test("Test: Network.parseCharacterList All", () async {
      final response = await Network.methodGet(baseUrl: Network.baseUrlHarryPotter, api: Network.apiHarryAllCharacters);
      List<Character> list = Network.parseCharacterList(response!);
      expect(list, const TypeMatcher<List<Character>>());
    });
  });


}