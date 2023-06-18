import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/tv/presentaion/widgets/tv_discover_widget.dart';
import 'package:movie_app/tv/presentaion/widgets/tv_top_rated_widget.dart';
import 'package:movie_app/tv/presentaion/widgets/tv_popular_widget.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TvDiscoverWidget(),
            const SizedBox(
              height: 15,
            ),
            Text(
              AppStrings.popularTvShow,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const TvPopularWidget(),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.topRatedTvShow,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const TopRatedTvWidget(),
          ],
        ),
      ),
    ));
  }
}
