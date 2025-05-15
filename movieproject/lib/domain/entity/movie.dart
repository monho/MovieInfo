class Movie {

  factory Movie.fromJson(final Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      rating: (json['vote_average'] ?? 0).toDouble(),
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteCount: json['vote_count'] ?? 0,
      popularity: (json['popularity'] ?? 0).toDouble(),
      runtime: json['runtime'] ?? 0,
      budget: json['budget'] ?? 0,
      revenue: json['revenue'] ?? 0,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((final e) => e['name'].toString())
              .toList() ??
          [],
      productionCompanies: (json['production_companies'] as List<dynamic>?)
              ?.map((final e) => 'https://image.tmdb.org/t/p/w200${e['logo_path']}')
              .where((final url) => !url.contains('null')) // 로고 없는 경우 제외
              .toList() ??
          [],
    );
  final int id;
  final String title;
  final String posterPath;
  final double rating;
  final String overview;
  final String releaseDate;
  final int voteCount;
  final double popularity;

  // ❗ DetailView에서 필요한 필드들
  final int runtime;
  final int budget;
  final int revenue;
  final List<String> genres;
  final List<String> productionCompanies;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.overview,
    required this.releaseDate,
    required this.voteCount,
    required this.popularity,
    required this.runtime,
    required this.budget,
    required this.revenue,
    required this.genres,
    required this.productionCompanies,
  });

  String get fullPosterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
}
