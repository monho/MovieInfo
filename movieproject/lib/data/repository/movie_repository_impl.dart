import 'package:movieproject/domain/entity/movie.dart';
import 'package:movieproject/data/repository/movie_repository.dart';
import 'package:movieproject/data/datasource/tmdb_api_service.dart';

class MovieRepositoryImpl implements MovieRepository {

  MovieRepositoryImpl(this.apiService);
  final TMDBApiService apiService;

  @override
  Future<List<Movie>> getNowPlaying() =>
      apiService.fetchMovies('/movie/now_playing?language=ko-KR&page=1');

  @override
  Future<List<Movie>> getPopular() =>
      apiService.fetchMovies('/movie/popular?language=ko-KR&page=1');

  @override
  Future<List<Movie>> getTopRated() =>
      apiService.fetchMovies('/movie/top_rated?language=ko-KR&page=1');

  @override
  Future<List<Movie>> getUpcoming() =>
      apiService.fetchMovies('/movie/upcoming?language=ko-KR&page=1');

  @override
  Future<Movie> getMovieDetail(final int id) =>
      apiService.fetchMovieDetail(id);
}