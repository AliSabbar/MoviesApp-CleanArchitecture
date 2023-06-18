import 'package:movie_app/core/network/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecases/base_movie_usecases.dart';
import 'package:movie_app/tv/domain/entities/tv.dart';
import 'package:movie_app/tv/domain/repository/base_tv_repository.dart';

class DiscoverTvUseCase extends BaseUseCases<List<Tv>,NoParameters> {
  final BaseTvRepository baseTvRepository;

  DiscoverTvUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async =>
    await  baseTvRepository.getDiscoverTv();
}
