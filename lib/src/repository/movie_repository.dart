import 'dart:convert';

import 'package:flutter_provider_pattern/src/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  var queryParam = {
    'api_key': '91462e1ef63bb441491e941ee27a4480',
  };

  Future<List<Movie>> loadMovies() async {
    var uri = Uri.https('api.themoviedb.org', '/3/movie/popular', queryParam);
    var response = await http.get(uri);
    Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> list = body['results'];

    return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  }
}
