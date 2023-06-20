import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/theme/app_icons/app_icons.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/widgets/cache_my_image.dart';
import 'package:movie_app/tv/presentaion/screens/tv_details_screen.dart';
import '../../../movies/presentaion/screens/movies_details_screen.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    super.key,
    required this.title,
    required this.id,
    required this.voteAverage,
    required this.image,
    required this.type,
  });

  final int id;
  final String title;
  final String image;
  final String type;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => type == AppStrings.movie
                    ? MovieDetailsScreen(
                        id: id,
                      )
                    : TvDetailsScreen(
                        id: id,
                      )));
      },
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CacheMyImage(image: image),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: AppColors.darkColor.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      )),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        AppIcons.starIcon,
                        color: AppColors.yellowColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        voteAverage.toString().substring(0, 3),
                        style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 150,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
