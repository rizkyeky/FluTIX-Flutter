part of model;

class Movie {
  int id;
  String title;
  double popularity;
  String releaseDate;
  String posterPath;
  String backdropPath;
  String overview;
  List<Genre> genres;
  double voteAverage;
  int voteCount;
  String country;

  String status;
  int runtime;

  Movie(
    this.id,
    this.title,
    this.popularity,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.voteCount,
    this.voteAverage,
    this.country,
    this.genres,

    this.status,
    this.runtime
  );

  factory Movie.initial() => Movie(
    0,
    '',
    0.0,
    '',
    '',
    '',
    '',
    0,
    0.0,
    '',
    [],
    '',
    0
  );

  factory Movie.fromJson(Map<String, dynamic> json) {

    return Movie(
      json['id'] as int,
      json['title'] as String,
      (json['popularity'] as num).toDouble(),
      json['release_date'] as String,
      json['poster_path'] as String,
      json['backdrop_path'] as String,
      json['overview'] as String,
      (json['vote_count'] as num).toInt(),
      (json['vote_average'] as num).toDouble(),
      json['original_language'] as String,

      ((json['genre_ids'] as List) ?? (json['genres'] as List))
        .map((e) {
          if (e is int) {
            return Genre.fromID(e);
          }
          else if (e is Map) {
            return Genre.fromID(e['id'] as int);
          }
          else {
            return Genre.fromID(0);
          } 
        }).toList(),

      (json['status'] as String) ?? '',
      (json['runtime'] as int) ?? 0,
    );
  }

  void duplicate(Movie movie) {
    id = movie.id ?? id;
    title = movie.title ?? title;
    popularity = movie.popularity ?? popularity;
    releaseDate = movie.releaseDate ?? releaseDate;
    posterPath = movie. posterPath ?? posterPath;
    backdropPath = movie.backdropPath ?? backdropPath;
    overview = movie.overview ?? overview;
    voteCount = movie.voteCount ?? voteCount;
    voteAverage = movie.voteAverage ?? voteAverage;
    country = movie.country ?? country;
    genres = movie.genres ?? genres;

    status = movie.status ?? status;
    runtime = movie.runtime ?? runtime;
  }

  @override
  String toString() => 'movie: $title ($genres)';
}
