// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final List<MovieGenres> genres;
  final String overview;
  final String image;
  final String backGroundImage;
  final String releaseDate;
  final int runTime;
  final double voteAverage;
  final int voteCount;
  const MovieDetails({
    required this.id,
    required this.title,
    required this.genres,
    required this.overview,
    required this.image,
    required this.backGroundImage,
    required this.releaseDate,
    required this.runTime,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      genres,
      overview,
      image,
      backGroundImage,
      releaseDate,
      runTime,
      voteAverage,
      voteCount,
    ];
  }
}
