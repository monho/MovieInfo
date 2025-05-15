import 'package:flutter/material.dart';
import 'package:movieproject/domain/entity/movie.dart';

import 'package:movieproject/presentation/detail/view/detail_view.dart';

class MovieSection extends StatelessWidget {

  const MovieSection({
    required this.title, required this.movies, super.key,
    this.showRanking = false,
  });
  final String title;
  final List<Movie> movies;
  final bool showRanking;

  @override
  Widget build(final BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (final context, final index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailView(movie: movie),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Hero(
                        tag: 'movie-${movie.id}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            movie.fullPosterUrl,
                            height: 180,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (showRanking)
                        Positioned(
                          left: 8,
                          bottom: 8,
                          child: CircleAvatar(
                            radius: 12,
                            // ignore: deprecated_member_use
                            backgroundColor: Colors.black.withOpacity(0.7),
                            child: Text('${index + 1}', style: const TextStyle(fontSize: 12)),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
}
