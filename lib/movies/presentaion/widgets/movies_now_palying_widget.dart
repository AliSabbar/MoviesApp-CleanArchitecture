
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/app_strings.dart';

import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/widgets/error_message.dart';
import 'package:movie_app/core/utils/widgets/slider.dart';

import 'package:movie_app/movies/presentaion/controller/movie_provider.dart';

class MoviesNowPlayingWidget extends ConsumerWidget {
  const MoviesNowPlayingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(movieProvider);
    
    switch (prov.movieNowPlayingState.requestStates) {
      case RequestStates.loading:
        return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator.adaptive()));
      case RequestStates.loaded:
        final nowPlaying = prov.movieNowPlayingState.data;
        return DefaultSlider(myList: nowPlaying,sectionName: AppStrings.nowPlaying,);

      case RequestStates.error:
        final message = prov.movieNowPlayingState.message;
        return ErrorMessage(message: message);
    }
  }
}

