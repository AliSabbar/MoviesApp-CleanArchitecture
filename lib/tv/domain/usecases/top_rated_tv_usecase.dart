// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/core/usecases/base_movie_usecases.dart';
import 'package:movie_app/tv/domain/repository/base_tv_repository.dart';

import '../entities/tv.dart';

class GetTopRatedTvUseCase extends BaseUseCases<List<Tv>,NoParameters> {
  BaseTvRepository baseTvRepository;
  GetTopRatedTvUseCase({
    required this.baseTvRepository,
  });
  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async => await baseTvRepository.getTopRatedTv();
}
