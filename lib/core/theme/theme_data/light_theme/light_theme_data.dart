import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/theme/app_font_size/app_font_size.dart';

class AppLightThemeData {
  static getLightThemeData() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppColors.backGroundColor,
      appBarTheme: lightAppBarTextTheme(),
      bottomNavigationBarTheme: lightBottomNavigationBar(),
      textTheme: lightTextTheme(),
           inputDecorationTheme: inputDecorationLightTheme(),
    );
  }

  static InputDecorationTheme inputDecorationLightTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyColor,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: AppColors.greyColor,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: AppColors.greyColor,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

  static BottomNavigationBarThemeData lightBottomNavigationBar() {
    return const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backGroundColor,
      elevation: 0.0,
      unselectedItemColor: AppColors.greyColor,
    );
  }

  static AppBarTheme lightAppBarTextTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.backGroundColor,
      scrolledUnderElevation: 0.0,
      titleTextStyle: TextStyle(
          color: AppColors.darkColor,
          fontSize: AppFontSize.titleFontSize,
          fontWeight: FontWeight.bold),
      toolbarHeight: 70.0,
      elevation: 0.0,
    );
  }

  static TextTheme lightTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
          color: AppColors.darkColor,
          fontSize: AppFontSize.titleFontSize,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: AppColors.darkColor,
          fontSize: AppFontSize.titleOfItemFontSize,
          fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
        color: AppColors.darkColor,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
          color: AppColors.darkColor,
          fontWeight: FontWeight.w500,
          fontSize: AppFontSize.iconDetailsFontSize),
      bodyMedium: TextStyle(
          color: AppColors.darkColor,
          fontSize: AppFontSize.bodyFontSize,
          fontWeight: FontWeight.w500),
    );
  }
}
