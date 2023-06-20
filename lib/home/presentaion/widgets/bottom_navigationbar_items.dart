import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_icons/app_icons.dart';
import 'package:movie_app/core/utils/app_strings.dart';

List<BottomNavigationBarItem> get bottomNavigationBarItems {
  return const [
    BottomNavigationBarItem(
        icon: Icon(
          AppIcons.movieIcon,
        ),
        label: AppStrings.moviesNavBar),
    BottomNavigationBarItem(
        icon: Icon(
          AppIcons.searchIcon,
        ),
        label: AppStrings.searchNavBar),
    BottomNavigationBarItem(
        icon: Icon(
          AppIcons.tvIcon,
        ),
        label: AppStrings.tvNavBar),
  ];
}
