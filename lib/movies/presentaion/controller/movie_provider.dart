import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/details_parameters/base_details_parameters.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/usecases/base_movie_usecases.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/general_states.dart';
import 'package:movie_app/movies/domain/usecases/movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecases/movie_top_rated_usecase.dart';
import '../../domain/usecases/movie_now_playing_usecase.dart';
import '../../domain/usecases/movie_papular_usecase.dart';

class MovieProvider extends ChangeNotifier {
  GeneralStates movieNowPlayingState = GeneralStates();
  GeneralStates popularMovieState = GeneralStates();
  GeneralStates topRatedMovieState = GeneralStates();
  GeneralStates movieDetailsState = GeneralStates();

  MovieProvider() {
    fetchNowMoviePlayingData();
    fetchPopularMovie();
    fetchTopRatedMovie();
    // fetchMovieDetails(MovieDetailsParameters(id: 385687));
  }

  fetchNowMoviePlayingData() async {
    final result =
        await MovieNowPlayingUseCase(sl()).call(const NoParameters());
    result.fold(
        (l) => movieNowPlayingState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => movieNowPlayingState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));
    notifyListeners();
  }

  fetchPopularMovie() async {
    final result = await MoviePapularUseCase(sl())(
        const NoParameters()); // call the function (call)
    result.fold(
        (l) => popularMovieState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => popularMovieState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));
    notifyListeners();
  }

  fetchTopRatedMovie() async {
    final result = await MovieTopRatedUseCase(sl()).call(const NoParameters());
    result.fold(
        (l) => topRatedMovieState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => topRatedMovieState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));
    notifyListeners();
  }

  fetchMovieDetails(BaseDetailsParameters parameters) async {
    final result = await MovieDetailsUseCase(baseMovieRepository: sl())
        .call(BaseDetailsParameters(id: parameters.id));
    result.fold(
        (l) => movieDetailsState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => movieDetailsState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));
  }

  notifyListeners();
}

final movieProvider = ChangeNotifierProvider((ref) => MovieProvider());
