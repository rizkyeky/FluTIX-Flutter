part of 'model.dart';

class Movie {
  int id;
  String title;
  double popularity;
  String releaseDate;
  String posterPath;
  String backdropPath;
  String overview;
  String status;
  List<String> genres;

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
    this.status,

    this.favorite,
    this.rating,
    this.country,
    this.genres
  );

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    json['id'] as int,
    json['title'] as String,
    json['popularity'] as double,
    json['release_date'] as String,
    json['poster_path'] as String,
    json['backdrop_path'] as String,
    json['overview'] as String,
    json['status'] as String,

    json['vote_count'] as int,
    json['vote_average'] as double,
    json['original_language'] as String,
    
    (json['genres'] as List<Map<String, dynamic>>)
      .map((e) => e['name'] as String).toList()
  );
}
