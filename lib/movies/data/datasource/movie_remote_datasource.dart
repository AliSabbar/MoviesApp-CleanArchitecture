import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/network/error/exceptions.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/movies/data/models/movie_details_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

import '../../../core/details_parameters/base_details_parameters.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieModel>>> getPopularMovies();

  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      BaseDetailsParameters parameters);

  Future<Either<Failure, List<MovieModel>>> getMovieRecommended(
      BaseDetailsParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      final response =
          await Dio().get(ApiConstance.getPlayingNowMovies).catchError((e) {
        if (e.response != null) {
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(e.response.data));
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });

      final right = List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));

      return Right(right);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetException catch (e) {
      return Left(InternetFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    try {
      final response =
          await Dio().get(ApiConstance.getPopularMovies).catchError((e) {
        if (e.response != null) {
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(e.response.data));
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });
      final result = List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetException catch (e) {
      return Left(InternetFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() async {
    try {
      final response =
          await Dio().get(ApiConstance.getTopRatedMovies).catchError((e) {
        if (e.response != null) {
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(e.response.data));
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });
      final result = List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetException catch (e) {
      return Left(InternetFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      BaseDetailsParameters parameters) async {
    try {
      final response = await Dio()
          .get(ApiConstance.getMovieDetails(parameters.id))
          .catchError((e) {
        if (e.response != null) {
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(e.response.data));
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });
      final result = MovieDetailsModel.fromJson(response.data);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetException catch (e) {
      return Left(InternetFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getMovieRecommended(
      BaseDetailsParameters parameters) async {
    try {
      final response = await Dio()
          .get(ApiConstance.getRecommendedMovies(parameters.id))
          .catchError((e) {
        if (e.response != null) {
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(e.response.data));
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });

      final result = List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetException catch (e) {
      return Left(InternetFailure(e.message));
    }
  }
}
