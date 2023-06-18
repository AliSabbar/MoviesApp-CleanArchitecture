import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/general_states.dart';
import 'package:movie_app/tv/domain/usecases/details_tv_usecase.dart';
import 'package:movie_app/tv/domain/usecases/recommended_tv_usecase.dart';

import '../../../core/details_parameters/base_details_parameters.dart';
import '../../../core/services/services_locator.dart';

class TvDetailsProvider extends ChangeNotifier {
  GeneralStates tvDetailsState = GeneralStates();
  GeneralStates tvRecommendedState = GeneralStates();
  TvDetailsProvider(id) {
    fetchTvDetails(parameters: BaseDetailsParameters(id: id));
    fetchTvRecommended(parameters: BaseDetailsParameters(id: id));
  }
  fetchTvDetails({required BaseDetailsParameters parameters}) async {
    final result = await TvDetailsUseCase(baseTvRepository: sl())
        .call(BaseDetailsParameters(id: parameters.id));
    result.fold(
        (l) => tvDetailsState = GeneralStates(
            requestStates: RequestStates.error, message: l.message),
        (r) => tvDetailsState =
            GeneralStates(requestStates: RequestStates.loaded, data: r));
    notifyListeners();
  }

  fetchTvRecommended({required BaseDetailsParameters parameters}) async {
    final result = await TvRecommendedUseCase(baseTvRepository: sl())
        .call(BaseDetailsParameters(id: parameters.id));
    result.fold(
        (l) => tvRecommendedState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => tvRecommendedState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));
    notifyListeners();
  }
}

final tvDetailsProvider = ChangeNotifierProvider.autoDispose
    .family<TvDetailsProvider, int>((ref, id) => TvDetailsProvider(id));
