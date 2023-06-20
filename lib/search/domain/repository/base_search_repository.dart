import 'package:dartz/dartz.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/search/domain/entities/search.dart';
import 'package:movie_app/search/domain/usecases/search_usecase.dart';

abstract class BaseSearchRepository {
  Future<Either<Failure, List<Search>>> search(SearchParameters parameters);
}
