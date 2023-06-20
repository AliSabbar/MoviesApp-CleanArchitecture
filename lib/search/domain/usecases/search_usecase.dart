// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/core/usecases/base_movie_usecases.dart';
import 'package:movie_app/search/domain/entities/search.dart';
import 'package:movie_app/search/domain/repository/base_search_repository.dart';

class SearchUseCase extends BaseUseCases<List<Search>, SearchParameters> {
  BaseSearchRepository baseSearchRepository;
  SearchUseCase({
    required this.baseSearchRepository,
  });
  @override
  Future<Either<Failure, List<Search>>> call(
          SearchParameters parameters) async =>
      await baseSearchRepository.search(parameters);
}

class SearchParameters extends Equatable {
  final String query;
 const SearchParameters({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}
