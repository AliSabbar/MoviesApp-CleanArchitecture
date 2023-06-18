
import 'package:movie_app/movies/domain/entities/genres.dart';

class MovieGenresModel extends MovieGenres {
  const MovieGenresModel({required super.id, required super.name});

  factory MovieGenresModel.fromJson(Map<String, dynamic> json) =>
      MovieGenresModel(id: json['id'], name: json['name']);
}
