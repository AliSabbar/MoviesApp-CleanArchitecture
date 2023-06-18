import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/theme/app_font_size/app_font_size.dart';
import 'package:movie_app/core/utils/app_constance.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/widgets/cache_my_image.dart';
import 'package:movie_app/core/utils/widgets/error_message.dart';
import 'package:movie_app/core/utils/widgets/movie_card.dart';
import 'package:movie_app/movies/presentaion/controller/movie_details_provider.dart';

class MovieDetailsWidget extends ConsumerWidget {
  const MovieDetailsWidget({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(movieDetailsProvider(id));
    switch (prov.movieDetailsState.requestStates) {
      case RequestStates.loading:
        return const Center(child: CircularProgressIndicator());
      case RequestStates.loaded:
        final movieDetails = prov.movieDetailsState.data;
        final movieRecommended = prov.movieRecommendedState.data;
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(ApiConstance.getImage(
                                image: movieDetails.image.toString())),
                            fit: BoxFit.cover)),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY:
                            5), // Adjust sigmaX and sigmaY for desired blur intensity
                    child: Container(
                      color: Colors.black.withOpacity(
                          0), // Adjust the opacity for desired effect
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: 120,
                    child: CacheMyImage(
                      image: movieDetails.backGroundImage.toString(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.yellowColor,
                              size: AppFontSize.iconDetailsSize,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                movieDetails.voteAverage
                                    .toString()
                                    .substring(0, 3),
                                style: Theme.of(context).textTheme.labelMedium),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.access_time_filled_rounded,
                              color: Colors.grey[300],
                              size: AppFontSize.iconDetailsSize,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(AppConstance.timeConvert(movieDetails.runTime),
                                style: Theme.of(context).textTheme.labelMedium),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(movieDetails.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      AppStrings.categories,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: movieDetails.genres.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Chip(
                              label: Text(
                            movieDetails.genres[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppStrings.description,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      movieDetails.overview,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      AppStrings.recommendedMovies,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.64,
                      ),
                      itemCount: movieRecommended.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return DefaultCard(
                          id: movieRecommended[index].id,
                          image: movieRecommended[index].image.toString(),
                          title: movieRecommended[index].title,
                          voteAverage: movieRecommended[index].voteAverage,
                          type: AppStrings.movie,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      case RequestStates.error:
        return Center(
            child: ErrorMessage(message: prov.movieDetailsState.message));
    }
  }
}
