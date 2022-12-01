import 'package:gen/app/catalogo/domain/entities/movies.dart';

class MoviesModel extends Movies{
  bool? adult;
  String? backdrop_path;
  List<int> genre_ids;
  int? id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  String? release_date;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;

  MoviesModel({
    this.adult,
    this.backdrop_path,
    required this.genre_ids,
    this.id,
    this.original_language,
    this.original_title,
    this.overview,
    this.popularity,
    this.poster_path,
    this.release_date,
    this.title,
    this.video,
    this.vote_average,
    this.vote_count
  }) : super(genre_ids: genre_ids);

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdrop_path,
      'genre_ids': List<int>.from(genre_ids.map((x) => x)),
      'id': id,
      'original_language': original_language,
      'original_title': original_title,
      'overview': overview,
      'popularity': popularity,
      'poster_path': poster_path,
      'release_date': release_date,
      'title': title,
      'video': video,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }

  static MoviesModel fromMap(Map<String, dynamic> map) {
    return MoviesModel(
      adult: map['adult'],
      backdrop_path: map['backdrop_path'],
      genre_ids: List<int>.from((map['genre_ids'] as List).map((x) => x)),
      id: map['id'],
      original_language: map['original_language'],
      original_title: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      poster_path: map['poster_path'],
      release_date: map['release_date'],
      title: map['title'],
      video: map['video'],
      vote_average: map['vote_average'],
      vote_count: map['vote_count'],
    );
  }
  
}

