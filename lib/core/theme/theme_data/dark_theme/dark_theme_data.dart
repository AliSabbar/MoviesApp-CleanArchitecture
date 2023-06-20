import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/theme/app_font_size/app_font_size.dart';

class AppDarkThemeData {
  static getDarkThemeData() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppColors.darkColor,
      appBarTheme: darkAppBarTheme(),
      bottomNavigationBarTheme: lightBottomNavigationBar(),
      textTheme: darkTextTheme(),
      inputDecorationTheme: inputDecorationDarkTheme(),
    );
  }

  static InputDecorationTheme inputDecorationDarkTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.whiteColor,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: AppColors.whiteColor,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: AppColors.whiteColor,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

  static BottomNavigationBarThemeData lightBottomNavigationBar() {
    return const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkColor,
      elevation: 0.0,
      unselectedItemColor: AppColors.greyColor,
    );
  }

  static AppBarTheme darkAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.darkColor,
      scrolledUnderElevation: 0.0,
      titleTextStyle: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 25,
          fontWeight: FontWeight.bold),
      toolbarHeight: 70.0,
      elevation: 0.0,
    );
  }

  static TextTheme darkTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
          color: AppColors.whiteColor,
          fontSize: AppFontSize.titleFontSize,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: AppFontSize.titleOfItemFontSize,
          fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: AppFontSize.iconDetailsFontSize),
      bodyMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: AppFontSize.bodyFontSize,
          fontWeight: FontWeight.w500),
    );
  }
}
