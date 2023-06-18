import 'package:movie_app/tv/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel(
      {required super.image,
      required super.poster,
      required super.genreIds,
      required super.id,
      required super.title,
      required super.voteAverage,
      required super.voteCount});

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
      image: json['backdrop_path'],
      poster: json['poster_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      id: json['id'],
      title: json['name'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count']);
}
