import 'dart:convert';

import 'package:movie_app/data/character.dart';
import 'package:movie_app/data/planet.dart';
import 'package:http/http.dart';


class API {

  static Future<List<Character>> getCharacters(Client client) async {
    final response =
    await client.get(Uri.parse('https://swapi.dev/api/people/'));

    return convertCharacter(response.body);
  }

  static List<Character> convertCharacter(String responseBody) {
    final json = jsonDecode(responseBody).cast<String,dynamic>();
    return json["results"].map<Character>((json) => Character.fromJson(json)).toList();
  }

  static Future<Planet> getPlanetByURL(Client client, String url) async {
    final response =
        await client.get(Uri.parse(url));
    final planet = jsonDecode(response.body).cast<String,dynamic>();
    return Planet.fromJson(planet);
  }

}