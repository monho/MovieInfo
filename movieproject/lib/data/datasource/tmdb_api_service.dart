import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieproject/domain/entity/movie.dart';

class TMDBApiService {

  TMDBApiService(this.apiKey);
  final String apiKey;

  static const _baseUrl = 'https://api.themoviedb.org/3';

  Map<String, String> get _headers => {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json;charset=utf-8',
  };

  Future<List<Movie>> fetchMovies(final String endpoint) async {
    final uri = Uri.parse('$_baseUrl$endpoint');

    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];
      return results.map((final e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('TMDB API 호출 실패: ${response.statusCode}');
    }
  }

  Future<Movie> fetchMovieDetail(final int movieId) async {
    final uri = Uri.parse('$_baseUrl/movie/$movieId?language=ko-KR');

    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('영화 상세 정보 호출 실패');
    }
  }
}
