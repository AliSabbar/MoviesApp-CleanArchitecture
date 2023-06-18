import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/details_parameters/base_details_parameters.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecases/movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecases/movie_recommended_usecase.dart';

import '../../../core/utils/general_states.dart';

class MovieDetailsProvider extends ChangeNotifier {
  MovieDetailsProvider(id) {
    fetchMovieDetails(BaseDetailsParameters(id: id));
    fetchMovieRecommended(BaseDetailsParameters(id: id));
  }
  GeneralStates movieDetailsState = GeneralStates();
  GeneralStates movieRecommendedState = GeneralStates();

  fetchMovieDetails(BaseDetailsParameters parameters) async {
    final result = await MovieDetailsUseCase(baseMovieRepository: sl())
        .call(BaseDetailsParameters(id: parameters.id));
    result.fold(
        (l) => movieDetailsState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => movieDetailsState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));
    notifyListeners();
  }

  fetchMovieRecommended(BaseDetailsParameters parameters) async {
    final result = await MovieRecommendedUseCase(baseMovieRepository: sl())
        .call(BaseDetailsParameters(id: parameters.id));
    result.fold(
        (l) => movieRecommendedState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => movieRecommendedState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));

    notifyListeners();
  }
}

final movieDetailsProvider = ChangeNotifierProvider.autoDispose
    .family<MovieDetailsProvider, int>((ref, id) => MovieDetailsProvider(id));
