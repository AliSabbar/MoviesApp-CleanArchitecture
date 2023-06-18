import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/widgets/ShimmerMovieLoading.dart';
import 'package:movie_app/core/utils/widgets/error_message.dart';
import 'package:movie_app/core/utils/widgets/movie_card.dart';
import 'package:movie_app/tv/presentaion/controller/tv_provider.dart';

class TopRatedTvWidget extends ConsumerWidget {
  const TopRatedTvWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(tvProvider);
    switch (prov.topRatedTvState.requestStates) {
      case RequestStates.loading:
        return const ShimmerMovieLoading();
      case RequestStates.loaded:
        final topRatedTv = prov.topRatedTvState.data;
        return ListPopularTv(
          topRatedTv: topRatedTv,
        
        );
      case RequestStates.error:
        return ErrorMessage(message: prov.popularTvState.message);
    }
  }
}

class ListPopularTv extends StatelessWidget {
  const ListPopularTv(
      {Key? key, required this.topRatedTv})
      : super(key: key);

  final List topRatedTv;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: topRatedTv.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return DefaultCard(
            id: topRatedTv[index].id,
            image: topRatedTv[index].image,
            title: topRatedTv[index].title,
            voteAverage: topRatedTv[index].voteAverage,
            type: AppStrings.tv,
          );
        },
      ),
    );
  }
}
