import 'package:movie_app/movies/data/models/movie_genres_model.dart';
import 'package:movie_app/movies/domain/entities/movie_detils.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.title,
      required super.genres,
      required super.overview,
      required super.image,
      required super.backGroundImage,
      required super.releaseDate,
      required super.runTime,
      required super.voteAverage,
      required super.voteCount});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          id: json['id'],
          title: json['title'],
          genres: List<MovieGenresModel>.from(
              json['genres'].map((e) => MovieGenresModel.fromJson(e))),
          overview: json['overview'],
          image: json['backdrop_path'],
          backGroundImage: json['poster_path'],
          releaseDate: json['release_date'],
          runTime: json['runtime'],
          voteAverage: json['vote_average'],
          voteCount: json['vote_count']);
}
