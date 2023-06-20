// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final int id;
  final int voteCount;
  final double voteAverage;
  final String name;
  final String title;
  final String image;
  final String backGroundImage;
  final String overview;
  final String mediaType;
 const Search({
    required this.id,
    required this.voteCount,
    required this.voteAverage,
   required  this.name,
    required this.title,
    required this.image,
    required this.backGroundImage,
    required this.overview,
    required this.mediaType,
  });

  @override
  List<Object> get props {
    return [
      id,
      voteCount,
      voteAverage,
      name,
      title,
      image,
      backGroundImage,
      overview,
      mediaType,
    ];
  }
}
