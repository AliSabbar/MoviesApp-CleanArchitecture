import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/home/presentaion/controller/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(prov.titles[prov.currentIndex]),
        actions: [
          IconButton(
            onPressed: () {
              prov.changeTheme();
            },
            icon: Icon(
              prov.isLight ? Icons.dark_mode_rounded : Icons.wb_sunny_rounded,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: prov.currentIndex,
          onTap: (index) {
            prov.changeIndex(index: index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.movie,
                ),
                label: AppStrings.movies),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.tv,
                ),
                label: AppStrings.tvNavBar),
          ]),
      body: prov.screens[prov.currentIndex],
    );
  }
}
