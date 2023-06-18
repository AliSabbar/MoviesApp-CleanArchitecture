import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final String title;
  final String image;
  final String poster;
  final List<int> genreIds;
  final int id;
  final double voteAverage;
  final int voteCount;
  const Tv({
    required this.title,
    required this.image,
    required this.poster,
    required this.genreIds,
    required this.id,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object> get props {
    return [
      image,
      poster,
      genreIds,
      id,
      title,
      voteAverage,
      voteCount,
    ];
  }
}
