import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:retrofit/http.dart';
import '../Model/MovieModel.dart';
class ApiService {

static const BASE_URL = "https://konda.co.in/";

static Future<List<MovieModel>> getMovie() async {
  try {
      final response =
      await http.get("https://jsonplaceholder.typicode.com/photos");
      if (response.statusCode == 200) {
        List<MovieModel> list = parseMovie(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Parse the JSON response and return list of Album Objects //
  static List<MovieModel> parseMovie(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MovieModel>((json) => MovieModel.fromJson(json)).toList();
  }

}



