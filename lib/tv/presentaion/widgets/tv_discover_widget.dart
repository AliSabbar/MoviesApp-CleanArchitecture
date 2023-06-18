import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/widgets/ShimmerMovieLoading.dart';
import 'package:movie_app/core/utils/widgets/error_message.dart';
import 'package:movie_app/tv/presentaion/controller/tv_provider.dart';

import '../../../core/utils/widgets/slider.dart';

class TvDiscoverWidget extends ConsumerWidget {
  const TvDiscoverWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(tvProvider);
    switch (prov.discoverTvState.requestStates) {
      case RequestStates.loading:
        return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator.adaptive()));
      case RequestStates.loaded:
        final discoverTv = prov.discoverTvState.data;
       
        return DefaultSlider(
          myList: discoverTv,
          sectionName: AppStrings.discoverTvShow,
        );

      case RequestStates.error:
        return ErrorMessage(message: prov.discoverTvState.message);
    }
  }
}
