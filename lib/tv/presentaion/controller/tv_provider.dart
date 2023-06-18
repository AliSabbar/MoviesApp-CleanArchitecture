import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/usecases/base_movie_usecases.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/general_states.dart';
import 'package:movie_app/tv/domain/usecases/discover_tv_usecase.dart';
import 'package:movie_app/tv/domain/usecases/popular_tv_usecase.dart';
import 'package:movie_app/tv/domain/usecases/top_rated_tv_usecase.dart';

class TvProvider extends ChangeNotifier {
  GeneralStates popularTvState = GeneralStates();
  GeneralStates topRatedTvState = GeneralStates();
  GeneralStates discoverTvState = GeneralStates();

  TvProvider() {
    getPopularTvShow();
    getTopRatedShow();
    getDiscoverTvShow();
  }

  getPopularTvShow() async {
    final result = await GetPopularTvUseCase(baseTvRepository: sl())
        .call(const NoParameters());
    result.fold(
        (l) => popularTvState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => popularTvState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));
    notifyListeners();
  }

  getTopRatedShow() async {
    final result = await GetTopRatedTvUseCase(baseTvRepository: sl())(
        const NoParameters());
    result.fold(
        (l) => topRatedTvState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => topRatedTvState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));

    notifyListeners();
  }

  getDiscoverTvShow() async {
    final result = await DiscoverTvUseCase(sl())(const NoParameters());
    result.fold(
        (l) => discoverTvState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => discoverTvState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));
    notifyListeners();
  }
}

final tvProvider = ChangeNotifierProvider((ref) => TvProvider());
