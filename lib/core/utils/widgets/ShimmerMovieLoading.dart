import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMovieLoading extends StatelessWidget {
  const ShimmerMovieLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
              baseColor: AppColors.greyColor,
              highlightColor: AppColors.greyColor.withOpacity(0.2),
              child: Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(15)),
              ),
            );
          },
        ));
  }
}
