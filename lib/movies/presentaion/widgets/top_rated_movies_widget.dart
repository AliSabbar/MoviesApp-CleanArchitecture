import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/widgets/ShimmerMovieLoading.dart';
import 'package:movie_app/core/utils/widgets/movie_card.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/widgets/error_message.dart';
import 'package:movie_app/movies/presentaion/controller/movie_provider.dart';

class TopRatedMoviesWidget extends ConsumerWidget {
  const TopRatedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(movieProvider);
    switch (prov.topRatedMovieState.requestStates) {
      case RequestStates.loading:
        return const ShimmerMovieLoading();
      case RequestStates.loaded:
        final topRatedMovies = prov.topRatedMovieState.data;
        return ListTopRatedMovies(
          topRatedMovies: topRatedMovies,
        );
      case RequestStates.error:
        final message = prov.topRatedMovieState.message;

        return ErrorMessage(message: message);
    }
  }
}

class ListTopRatedMovies extends StatelessWidget {
  const ListTopRatedMovies({Key? key, required this.topRatedMovies})
      : super(key: key);

  final List topRatedMovies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: topRatedMovies.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return DefaultCard(
            id: topRatedMovies[index].id,
            image: topRatedMovies[index].image,
            title: topRatedMovies[index].title,
            voteAverage: topRatedMovies[index].voteAverage,
            type: AppStrings.movie,
          );
        },
      ),
    );
  }
}
