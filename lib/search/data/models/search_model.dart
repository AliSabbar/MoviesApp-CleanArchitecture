import 'package:movie_app/search/domain/entities/search.dart';

class SearchModel extends Search {
  const SearchModel(
      {required super.name,
      required super.title,
      required super.id,
      required super.voteCount,
      required super.voteAverage,
      required super.image,
      required super.backGroundImage,
      required super.overview,
      required super.mediaType,
      });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
      id: json['id'],
      title: json['title'],
      name: json['name'],
      voteCount: json['vote_count'],
      voteAverage: json['vote_average'],
      image: json['backdrop_path']??'6VtzCw8Wd9UWSA5FcXK6Kh2y5FE.jpg',
      backGroundImage: json['poster_path'],
      overview: json['overview'],
      mediaType: json['media_type'],

      );
}
