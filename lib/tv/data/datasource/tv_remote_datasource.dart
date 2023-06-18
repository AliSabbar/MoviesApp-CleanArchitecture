import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/details_parameters/base_details_parameters.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/network/error/exceptions.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/tv/data/models/tv_details_model.dart';
import 'package:movie_app/tv/data/models/tv_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<Either<Failure, List<TvModel>>> getPopularTv();
  Future<Either<Failure, List<TvModel>>> getTopRatedTv();
  Future<Either<Failure, List<TvModel>>> getDiscoverTv();
  Future<Either<Failure, TvDetailsModel>> getDetailsTv(
      BaseDetailsParameters parameters);
  Future<Either<Failure, List<TvModel>>> getRecommendedTv(
      BaseDetailsParameters parameters);
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<Either<Failure, List<TvModel>>> getPopularTv() async {
    try {
      final response =
          await Dio().get(ApiConstance.getPopularTv).catchError((e) {
        if (e.response != null) {
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(e.response.data));
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });

      final result = List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetException catch (e) {
      return Left(InternetFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getTopRatedTv() async {
    try {
      final response =
          await Dio().get(ApiConstance.getTopRatedTv).catchError((e) {
        if (e.response != null) {
          throw ServerException(errorMessageModel: e.response.data);
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });

      final result = List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetException catch (e) {
      return Left(InternetFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getDiscoverTv() async {
    try {
      final response =
          await Dio().get(ApiConstance.getDiscoverTv).catchError((e) {
        if (e.response != null) {
          throw ServerException(errorMessageModel: e.response.data);
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });

      final result = List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetFailure catch (e) {
      return Left(InternetFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, TvDetailsModel>> getDetailsTv(
      BaseDetailsParameters parameters) async {
    try {
      final response = await Dio()
          .get(ApiConstance.getTvDetails(parameters.id))
          .catchError((e) {
        if (e.response != null) {
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(e.response.data));
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });

      final result = TvDetailsModel.fromJson(response.data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetException catch (e) {
      return Left(InternetFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getRecommendedTv(
      BaseDetailsParameters parameters) async {
    try {
      final response = await Dio()
          .get(ApiConstance.getRecommendedTv(parameters.id))
          .catchError((e) {
        if (e.response != null) {
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(e.response.data));
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });
      final result = List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetException catch (e) {
      return Left(InternetFailure(e.message));
    }
  }
}
