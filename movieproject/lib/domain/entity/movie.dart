class Movie {

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.overview,
  });

  factory Movie.fromJson(final Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      rating: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] ?? '',
    );
  final int id;
  final String title;
  final String posterPath;
  final double rating;
  final String overview;

  String get fullPosterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
}
