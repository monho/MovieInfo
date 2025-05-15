import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieproject/domain/entity/movie.dart';
import 'package:movieproject/presentation/home/viewmodel/home_view_model.dart';
import 'package:movieproject/core/widgets/custom_widgets.dart';
import 'package:movieproject/core/widgets/movie_section.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final nowPlaying = ref.watch(nowPlayingProvider);
    final popular = ref.watch(popularProvider);
    final topRated = ref.watch(topRatedProvider);
    final upcoming = ref.watch(upcomingProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // ✅ 인기순 중 첫 번째 영화로 상단 배너 출력
              popular.when(
                data: (final movies) => _buildTopBanner(movies.first),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (final e, _) => const SizedBox(), // 실패 시 빈 영역 처리
              ),
              const SizedBox(height: 20),
              _buildSection(title: '현재 상영중', data: nowPlaying),
              _buildSection(title: '인기순', data: popular, showRanking: true),
              _buildSection(title: '평점 높은순', data: topRated),
              _buildSection(title: '개봉예정', data: upcoming),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBanner(final Movie movie) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('가장 인기있는', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Hero(
              tag: 'popular-${movie.id}',
              child: RoundedImage(imageUrl: movie.fullPosterUrl),
            ),
            const SizedBox(height: 8),
            Text(movie.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      );

  Widget _buildSection({
    required final String title,
    required final AsyncValue<List<Movie>> data,
    final bool showRanking = false,
  }) => data.when(
      data: (final movies) => MovieSection(title: title, movies: movies, showRanking: showRanking),
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (final e, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          '❗ $title 정보를 불러오는 중 에러 발생\n$e',
          style: const TextStyle(color: Colors.redAccent),
        ),
      ),
    );
}
