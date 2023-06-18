// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/details_parameters/base_details_parameters.dart';

import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/core/usecases/base_movie_usecases.dart';
import 'package:movie_app/movies/domain/entities/movie_detils.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class MovieDetailsUseCase
    extends BaseUseCases<MovieDetails, BaseDetailsParameters> {
  BaseMovieRepository baseMovieRepository;
  MovieDetailsUseCase({
    required this.baseMovieRepository,
  });
  @override
  Future<Either<Failure, MovieDetails>> call(
          BaseDetailsParameters parameters) async =>
      await baseMovieRepository.getMovieDetails(parameters);
}


