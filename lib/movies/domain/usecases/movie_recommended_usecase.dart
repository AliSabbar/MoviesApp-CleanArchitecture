import 'package:movie_app/core/details_parameters/base_details_parameters.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecases/base_movie_usecases.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/movie_details_usecase.dart';

import '../entities/movie.dart';

class MovieRecommendedUseCase
    extends BaseUseCases<List<Movie>, BaseDetailsParameters> {
  MovieRecommendedUseCase({required this.baseMovieRepository});
  BaseMovieRepository baseMovieRepository;
  @override
  Future<Either<Failure, List<Movie>>> call(
      BaseDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieRecommended(parameters);
  }
}
