import 'package:movie_app/core/details_parameters/base_details_parameters.dart';
import 'package:movie_app/tv/data/datasource/tv_remote_datasource.dart';
import 'package:movie_app/tv/domain/entities/tv.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/tv/domain/entities/tv_details.dart';
import 'package:movie_app/tv/domain/repository/base_tv_repository.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvRepository(this.baseTvRemoteDataSource);
  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async {
    final result = await baseTvRemoteDataSource.getPopularTv();
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async {
    final result = await baseTvRemoteDataSource.getTopRatedTv();
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, List<Tv>>> getDiscoverTv() async {
    final result = await baseTvRemoteDataSource.getDiscoverTv();
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(
      BaseDetailsParameters parameters) async {
    final result = await baseTvRemoteDataSource.getDetailsTv(parameters);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvRecommended(
      BaseDetailsParameters parameters) async {
    final result = await baseTvRemoteDataSource.getRecommendedTv(parameters);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
