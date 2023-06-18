import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/widgets/ShimmerMovieLoading.dart';
import 'package:movie_app/core/utils/widgets/error_message.dart';
import 'package:movie_app/core/utils/widgets/movie_card.dart';
import 'package:movie_app/movies/presentaion/controller/movie_provider.dart';

class PopularMoviesWidget extends ConsumerWidget {
  const PopularMoviesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(movieProvider);
    switch (prov.popularMovieState.requestStates) {
      case RequestStates.loading:
        return const ShimmerMovieLoading();
      case RequestStates.loaded:
        final popularMovies = prov.popularMovieState.data;
        return ListPopularMovies(
          popularMovie: popularMovies,
        );
      case RequestStates.error:
        final message = prov.popularMovieState.message;
        return ErrorMessage(message: message);
    }
  }
}

class ListPopularMovies extends StatelessWidget {
  const ListPopularMovies(
      {Key? key, required this.popularMovie,})
      : super(key: key);

  final List popularMovie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: popularMovie.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return DefaultCard(
            id: popularMovie[index].id,
            image: popularMovie[index].image,
            title: popularMovie[index].title,
            voteAverage: popularMovie[index].voteAverage,
            type: AppStrings.movie,
          );
        },
      ),
    );
  }
}
