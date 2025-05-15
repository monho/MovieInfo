import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieproject/domain/entity/movie.dart';
import 'package:movieproject/data/datasource/tmdb_api_service.dart';
import 'package:movieproject/data/repository/movie_repository_impl.dart';
import 'package:movieproject/core/screet/secrets.dart' as key;


const _apiKey = key.kTMDBApiKey;
final movieRepositoryProvider = Provider<MovieRepositoryImpl>((final ref) => MovieRepositoryImpl(TMDBApiService(_apiKey)));

final nowPlayingProvider = FutureProvider<List<Movie>>((final ref) async {
  final repo = ref.watch(movieRepositoryProvider);
  return repo.getNowPlaying();
});

final popularProvider = FutureProvider<List<Movie>>((final ref) async {
  final repo = ref.watch(movieRepositoryProvider);
  return repo.getPopular();
});

final topRatedProvider = FutureProvider<List<Movie>>((final ref) async {
  final repo = ref.watch(movieRepositoryProvider);
  return repo.getTopRated();
});

final upcomingProvider = FutureProvider<List<Movie>>((final ref) async {
  final repo = ref.watch(movieRepositoryProvider);
  return repo.getUpcoming();
});
