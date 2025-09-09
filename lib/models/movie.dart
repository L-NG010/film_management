class Movie {
  final String id;
  final String title;
  final int year;
  final String posterUrl;
  final List<String> genres;
  final String synopsis;
  bool isFavorite;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.posterUrl,
    required this.genres,
    required this.synopsis,
    this.isFavorite = false,
  });
}