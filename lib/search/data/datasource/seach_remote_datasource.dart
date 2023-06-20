import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/network/error/exceptions.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/search/data/models/search_model.dart';
import 'package:movie_app/search/domain/usecases/search_usecase.dart';

abstract class BaseSearchRemoteDataSource {
  Future<Either<Failure, List<SearchModel>>> searchItem(
      SearchParameters parameters);
}

class SearchRemoteDataSource extends BaseSearchRemoteDataSource {
  @override
  Future<Either<Failure, List<SearchModel>>> searchItem(
      SearchParameters parameters) async {
    try {
      final response = await Dio()
          .get(ApiConstance.search(query: parameters.query))
          .catchError((e) {
        if (e.response != null) {
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(e.response.data));
        } else {
          throw InternetException(message: 'check your internet connection');
        }
      });

      final result = List<SearchModel>.from((response.data['results'] as List)
          .map((e) => SearchModel.fromJson(e)));

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    } on InternetException catch (e) {
      return Left(InternetFailure(e.message));
    }
  }
}
