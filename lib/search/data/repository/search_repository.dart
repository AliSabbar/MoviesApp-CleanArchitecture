// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/search/data/datasource/seach_remote_datasource.dart';
import 'package:movie_app/search/domain/entities/search.dart';
import 'package:movie_app/search/domain/repository/base_search_repository.dart';
import 'package:movie_app/search/domain/usecases/search_usecase.dart';

class SearchRepository extends BaseSearchRepository {
  BaseSearchRemoteDataSource remoteDataSource;
  SearchRepository({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, List<Search>>> search(
      SearchParameters parameters) async {
    final result = await remoteDataSource.searchItem(parameters);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
