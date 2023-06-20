import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/movies/presentaion/screens/movies_screen.dart';
import 'package:movie_app/search/presentation/screens/search_screen.dart';
import 'package:movie_app/tv/presentaion/screens/tv_screen.dart';

class HomeProvider extends ChangeNotifier {
  List<Widget> screens = [
    const MoviesScreen(),
    const SearchScreen(),
    const TvScreen(),
  ];
  List<String> titles = [AppStrings.moviesNavBar,AppStrings.searchNavBar ,AppStrings.tvNavBar];
  int currentIndex = 0;
  bool isLight = false;
  changeIndex({required int index}) {
    currentIndex = index;
    notifyListeners();
  }

  changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }
}

final homeProvider = ChangeNotifierProvider((ref) => HomeProvider());
