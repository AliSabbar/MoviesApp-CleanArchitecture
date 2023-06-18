import 'package:movie_app/core/details_parameters/base_details_parameters.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecases/base_movie_usecases.dart';
import 'package:movie_app/tv/domain/entities/tv.dart';
import 'package:movie_app/tv/domain/repository/base_tv_repository.dart';

class TvRecommendedUseCase
    extends BaseUseCases<List<Tv>, BaseDetailsParameters> {
  BaseTvRepository baseTvRepository;
  TvRecommendedUseCase({required this.baseTvRepository});
  @override
  Future<Either<Failure, List<Tv>>> call(
      BaseDetailsParameters parameters) async {
    return await baseTvRepository.getTvRecommended(parameters);
  }
}
