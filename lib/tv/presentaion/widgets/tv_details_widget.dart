import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/theme/app_font_size/app_font_size.dart';
import 'package:movie_app/core/theme/app_icons/app_icons.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/widgets/cache_my_image.dart';
import 'package:movie_app/core/utils/widgets/error_message.dart';
import 'package:movie_app/tv/data/models/tv_details_model.dart';
import 'package:movie_app/tv/presentaion/controller/tv_details_provider.dart';

import '../../../core/utils/widgets/movie_card.dart';

class TvDetailsWidget extends ConsumerWidget {
  const TvDetailsWidget({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(tvDetailsProvider(id));
    switch (prov.tvDetailsState.requestStates) {
      case RequestStates.loading:
        return const Center(child: CircularProgressIndicator());
      case RequestStates.loaded:
        final tvDetails = prov.tvDetailsState.data;
        final tvRecommended = prov.tvRecommendedState.data;
        return TvDetailsLoaded(
            tvDetails: tvDetails, tvRecommended: tvRecommended);
      case RequestStates.error:
        return Center(
            child: ErrorMessage(message: prov.tvDetailsState.message));
    }
  }
}

class TvDetailsLoaded extends StatelessWidget {
  const TvDetailsLoaded(
      {super.key, required this.tvDetails, required this.tvRecommended});

  final TvDetailsModel tvDetails;

  final List tvRecommended;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(ApiConstance.getImage(
                            image: tvDetails.image.toString())),
                        fit: BoxFit.cover)),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY:
                        5), // Adjust sigmaX and sigmaY for desired blur intensity
                child: Container(
                  color: Colors.black
                      .withOpacity(0), // Adjust the opacity for desired effect
                ),
              ),
                 Positioned(
                left: 5,
                top: 30,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    AppIcons.arrowBackIcon,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              Positioned(
                bottom: -45,
                child: CacheMyImage(
                  image:
                      ApiConstance.getImage(image: tvDetails.backGroundImage),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          AppIcons.starIcon,
                          color: AppColors.yellowColor,
                          size: AppFontSize.iconDetailsSize,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          tvDetails.voteAverage.toString().substring(0, 3),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          AppIcons.tvBeginDateIcon,
                          color: Colors.grey[300],
                          size: AppFontSize.iconDetailsSize,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          tvDetails.date.toString(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      tvDetails.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
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
                    itemCount: tvDetails.genres.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Chip(
                          label: Text(
                        tvDetails.genres[index].name,
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
                Text(tvDetails.overview,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppStrings.creators,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                tvDetails.creators.isEmpty
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              AppStrings.noInformationFound,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 120,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: tvDetails.creators.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                tvDetails.creators[index].image != null
                                    ? CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            ApiConstance.getImage(
                                                    image: tvDetails
                                                        .creators[index].image)
                                                .toString()),
                                      )
                                    : const CircleAvatar(
                                        radius: 35,
                                        backgroundColor: AppColors.whiteColor,
                                        child: Icon(
                                          AppIcons.personIcon,
                                          size: 40,
                                          color: AppColors.darkColor,
                                        ),
                                      ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${tvDetails.creators[index].name.toString().split(' ').first}\n${tvDetails.creators[index].name.toString().split(' ').last}",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppStrings.recommendedTvShow,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.64,
                  ),
                  itemCount: tvRecommended.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return DefaultCard(
                      id: tvRecommended[index].id,
                      image: tvRecommended[index].image.toString(),
                      title: tvRecommended[index].title,
                      voteAverage: tvRecommended[index].voteAverage,
                      type: AppStrings.tv,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
