import 'package:dartz/dartz.dart';
import 'package:movie_app/core/details_parameters/base_details_parameters.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_detils.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowMoviesPlaying();

  Future<Either<Failure, List<Movie>>> getPapularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      BaseDetailsParameters parameters);

  Future<Either<Failure, List<Movie>>> getMovieRecommended(
      BaseDetailsParameters parameters);
}
