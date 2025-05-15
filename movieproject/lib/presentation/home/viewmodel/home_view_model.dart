import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieproject/domain/entity/movie.dart';
import 'package:movieproject/data/datasource/tmdb_api_service.dart';
import 'package:movieproject/data/repository/movie_repository_impl.dart';
import 'package:movieproject/core/screet/secrets.dart' as key;

const _apiKey = key.kTMDBApiKey;

final movieRepositoryProvider = Provider<MovieRepositoryImpl>((final ref) => MovieRepositoryImpl(TMDBApiService(_apiKey)));

/// 현재 상영중
final nowPlayingProvider = AsyncNotifierProvider<NowPlayingNotifier, List<Movie>>(
  NowPlayingNotifier.new,
);

class NowPlayingNotifier extends AsyncNotifier<List<Movie>> {
  @override
  Future<List<Movie>> build() async {
    final repo = ref.watch(movieRepositoryProvider);
    return await repo.getNowPlaying();
  }
}

///  인기순
final popularProvider = AsyncNotifierProvider<PopularNotifier, List<Movie>>(
  PopularNotifier.new,
);

class PopularNotifier extends AsyncNotifier<List<Movie>> {
  @override
  Future<List<Movie>> build() async {
    final repo = ref.watch(movieRepositoryProvider);
    return await repo.getPopular();
  }
}

///  평점 높은순
final topRatedProvider = AsyncNotifierProvider<TopRatedNotifier, List<Movie>>(
  TopRatedNotifier.new,
);

class TopRatedNotifier extends AsyncNotifier<List<Movie>> {
  @override
  Future<List<Movie>> build() async {
    final repo = ref.watch(movieRepositoryProvider);
    return await repo.getTopRated();
  }
}

///  개봉 예정
final upcomingProvider = AsyncNotifierProvider<UpcomingNotifier, List<Movie>>(
  UpcomingNotifier.new,
);

class UpcomingNotifier extends AsyncNotifier<List<Movie>> {
  @override
  Future<List<Movie>> build() async {
    final repo = ref.watch(movieRepositoryProvider);
    return await repo.getUpcoming();
  }
}
