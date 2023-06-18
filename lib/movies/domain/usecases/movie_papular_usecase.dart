import 'package:dartz/dartz.dart';
import 'package:movie_app/core/network/error/failure.dart';
import 'package:movie_app/core/usecases/base_movie_usecases.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class MoviePapularUseCase extends BaseUseCases<List<Movie>,NoParameters> {
  final BaseMovieRepository baseMovieRepository;
  MoviePapularUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async =>
      await baseMovieRepository.getPapularMovies();
}
