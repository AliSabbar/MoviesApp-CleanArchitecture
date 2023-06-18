import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/widgets/ShimmerMovieLoading.dart';
import 'package:movie_app/core/utils/widgets/error_message.dart';
import 'package:movie_app/core/utils/widgets/movie_card.dart';
import 'package:movie_app/tv/presentaion/controller/tv_provider.dart';

class TvPopularWidget extends ConsumerWidget {
  const TvPopularWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(tvProvider);
    switch (prov.popularTvState.requestStates) {
      case RequestStates.loading:
        return const ShimmerMovieLoading();
      case RequestStates.loaded:
        final popularTv = prov.popularTvState.data;
        return ListPopularTv(
          popularTv: popularTv,
      
        );
      case RequestStates.error:
        return ErrorMessage(
          message: prov.popularTvState.message,
        );
    }
  }
}

class ListPopularTv extends StatelessWidget {
  const ListPopularTv(
      {Key? key, required this.popularTv})
      : super(key: key);

  final List popularTv;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: popularTv.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return  DefaultCard(
                  id: popularTv[index].id,
                  image: popularTv[index].image.toString(),
                  title: popularTv[index].title,
                  voteAverage: popularTv[index].voteAverage,
                  type: AppStrings.tv,
                );
        },
      ),
    );
  }
}
