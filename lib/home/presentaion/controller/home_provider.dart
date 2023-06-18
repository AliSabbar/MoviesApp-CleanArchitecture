import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/movies/presentaion/screens/movies_screen.dart';
import 'package:movie_app/tv/presentaion/screens/tv_screen.dart';

class HomeProvider extends ChangeNotifier {
  List<Widget> screens = [
    const MoviesScreen(),
    const TvScreen(),
  ];
  List<String> titles = ['Movies', 'Tv Show'];
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
