class Movie {
  final String title;
  final String director;
  final String posterUrl;
  final String year;
  final String plot;
  final String actors;
  final String genre;
  final String runtime;
  final String language;
  final String country;
  final String imdbRating;
  final String imdbVotes;
  final String awards;

  Movie({
    required this.title,
    required this.director,
    required this.posterUrl,
    required this.year,
    required this.plot,
    required this.actors,
    required this.genre,
    required this.runtime,
    required this.language,
    required this.country,
    required this.imdbRating,
    required this.imdbVotes,
    required this.awards,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? 'Unknown Title',
      director: json['Director'] ?? 'Unknown Director',
      posterUrl: (json['Poster'] ?? '').replaceFirst('http://', 'https://'),
      year: json['Year'] ?? '',
      plot: json['Plot'] ?? '',
      actors: json['Actors'] ?? '',
      genre: json['Genre'] ?? '',
      runtime: json['Runtime'] ?? '',
      language: json['Language'] ?? '',
      country: json['Country'] ?? '',
      imdbRating: json['imdbRating'] ?? '',
      imdbVotes: json['imdbVotes'] ?? '',
      awards: json['Awards'] ?? '',
    );
  }
}
