import 'package:movie_app/tv/data/models/tv_creaors_model.dart';
import 'package:movie_app/tv/data/models/tv_genres_model.dart';
import 'package:movie_app/tv/domain/entities/tv_genres.dart';

import '../../domain/entities/tv_details.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel(
      {required super.id,
      required super.title,
      required super.overview,
      required super.date,
      required super.image,
      required super.backGroundImage,
      required super.status,
      required super.genres,
      required super.voteAverage,
      required super.voteCount,
      required super.numberOfSeason,
      required super.creators});

 factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
      id: json['id'],
      title: json['name'],
      overview: json['overview'],
      date: json['last_air_date'],
      image: json['backdrop_path'],
      backGroundImage: json['poster_path'],
      status: json['status'],
      genres: List<TvGenresModel>.from((json['genres'] as List).map((e) => TvGenresModel.fromJson(e))),
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      numberOfSeason: json['number_of_seasons'],
      creators: List.from((json['created_by'] as List).map((e) => TvCreatorsModel.fromJson(e))));
}
