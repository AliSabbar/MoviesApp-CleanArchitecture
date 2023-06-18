import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:shimmer/shimmer.dart';

class CacheMyImage extends StatelessWidget {
  const CacheMyImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: UniqueKey(),
      imageUrl: ApiConstance.getImage(image: image),
      errorWidget: (context, url, error) => Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
            color: AppColors.greyColor,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.error_rounded,
              size: 30,
              color: Colors.red,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              AppStrings.errorLoadImage,
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: 150,
        height: 200,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColors.greyColor,
        highlightColor: AppColors.greyColor.withOpacity(0.2),
        child: Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
