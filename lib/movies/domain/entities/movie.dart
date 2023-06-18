import 'package:equatable/equatable.dart';


class Movie extends Equatable {
  final int id;
  final List<int> genreIds;
  final String title;
  final String overview;
  final String image;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  const Movie({
    required this.id,
    required this.genreIds,
    required this.title,
    required this.image,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
  });


  @override
  List<Object> get props {
    return [
      id,
      genreIds,
      title,
      overview,
      image,
      voteAverage,
      voteCount,
      releaseDate,
    ];
  }
}
