import 'package:flutter/material.dart';
import 'package:movieproject/domain/entity/movie.dart';
import 'package:movieproject/core/widgets/custom_widgets.dart';

class DetailView extends StatelessWidget {

  const DetailView({required this.movie, super.key});
  final Movie movie;

  @override
  Widget build(final BuildContext context) => Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'movie-${movie.id}',
                child: RoundedImage(imageUrl: movie.fullPosterUrl),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('${movie.releaseDate} · ${movie.runtime}분'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: movie.genres.map((final genre) => Chip(label: Text(genre))).toList(),
                    ),
                    const SizedBox(height: 16),
                    Text(movie.overview),
                    const SizedBox(height: 20),
                    const Text('흥행정보', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InfoBox(title: '평점', value: movie.rating.toStringAsFixed(1)),
                          InfoBox(title: '투표수', value: '${movie.voteCount}'),
                          InfoBox(title: '인기점수', value: movie.popularity.toStringAsFixed(1)),
                          InfoBox(title: '예산', value: '\$${movie.budget}'),
                          InfoBox(title: '수익', value: '\$${movie.revenue}'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('제작사', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: movie.productionCompanies.map((final url) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Opacity(
                            opacity: 0.9,
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.network(url),
                            ),
                          ),
                        )).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
