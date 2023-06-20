import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/theme/app_font_size/app_font_size.dart';
import 'package:movie_app/core/theme/app_icons/app_icons.dart';

class EmptySearchStateWidget extends StatelessWidget {
  const EmptySearchStateWidget(
      {super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: AppFontSize.searchNotFoundIconsSize,
          color: AppColors.deepPurpleColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
