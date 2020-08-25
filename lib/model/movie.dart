part of model;

class Movie {
  int id;
  String title;
  double popularity;
  String releaseDate;
  String posterPath;
  String backdropPath;
  String overview;
  String status;
  List<Genre> genres;

  int favorite;
  double rating;
  String country;

  Movie(
    this.id,
    this.title,
    this.popularity,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.favorite,
    this.rating,
    this.country,

    this.genres,
    this.status,
  );

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    json['id'] as int,
    json['title'] as String,
    json['popularity'] as double,
    json['release_date'] as String,
    json['poster_path'] as String,
    json['backdrop_path'] as String,
    json['overview'] as String,
    json['vote_count'] as int,
    json['vote_average'] as double,
    json['original_language'] as String,

    (json['genre_ids'] as List)
      .map((e) => Genre.fromID(e as int)).toList(),
      
    '',
  );
}
