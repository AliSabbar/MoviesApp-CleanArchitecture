import 'package:movie_app/core/details_parameters/base_details_parameters.dart';
import 'package:movie_app/core/network/error/exceptions.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie_detils.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

import '../datasource/movie_remote_datasource.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowMoviesPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, List<Movie>>> getPapularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      BaseDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovieRecommended(
      BaseDetailsParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getMovieRecommended(parameters);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
