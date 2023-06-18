import 'package:dartz/dartz.dart';
import 'package:movie_app/core/details_parameters/base_details_parameters.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/tv/domain/entities/tv.dart';
import 'package:movie_app/tv/domain/entities/tv_details.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tv>>> getPopularTv();
  Future<Either<Failure, List<Tv>>> getTopRatedTv();
  Future<Either<Failure, List<Tv>>> getDiscoverTv();
  Future<Either<Failure, TvDetails>> getTvDetails(
      BaseDetailsParameters parameters);
  Future<Either<Failure, List<Tv>>> getTvRecommended(
      BaseDetailsParameters parameters);
}
