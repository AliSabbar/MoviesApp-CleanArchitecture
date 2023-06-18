// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movie_app/tv/domain/entities/tv_genres.dart';
import 'package:movie_app/tv/domain/entities/tv_creators.dart';

class TvDetails extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String date;
  final String image;
  final String backGroundImage;
  final String status;
  final List<TvGenres> genres;
  final List<TvCreators> creators;
  final double voteAverage;
  final int voteCount;
  final int numberOfSeason;
  const TvDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.date,
    required this.image,
    required this.backGroundImage,
    required this.status,
    required this.genres,
    required this.voteAverage,
    required this.voteCount,
    required this.numberOfSeason,
    required this.creators,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      overview,
      date,
      image,
      backGroundImage,
      status,
      creators,
      genres,
      voteAverage,
      voteCount,
      numberOfSeason,
    ];
  }
}
