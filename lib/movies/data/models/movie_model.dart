import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {
        required super.id,
      required super.genreIds,
      required super.title,
      required super.overview,
      required super.voteAverage,
      required super.voteCount,
      required super.releaseDate,
      required super.image});
      
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
  
      id: json['id'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      title: json['title'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
      releaseDate: json['release_date'],
      image: json['backdrop_path']);
}
