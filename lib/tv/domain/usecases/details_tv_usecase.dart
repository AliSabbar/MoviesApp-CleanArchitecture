// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/details_parameters/base_details_parameters.dart';

import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/core/usecases/base_movie_usecases.dart';
import 'package:movie_app/tv/domain/entities/tv_details.dart';
import 'package:movie_app/tv/domain/repository/base_tv_repository.dart';

class TvDetailsUseCase extends BaseUseCases<TvDetails, BaseDetailsParameters> {
  final BaseTvRepository baseTvRepository;
  TvDetailsUseCase({
    required this.baseTvRepository,
  });
  @override
  Future<Either<Failure, TvDetails>> call(
      BaseDetailsParameters parameters) async {
    return await baseTvRepository.getTvDetails(parameters);
  }
}
