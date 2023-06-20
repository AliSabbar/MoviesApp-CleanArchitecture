import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/theme/app_icons/app_icons.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/home/presentaion/controller/home_provider.dart';
import 'package:movie_app/home/presentaion/widgets/bottom_navigationbar_items.dart';

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
              prov.isLight ? AppIcons.moonIcon : AppIcons.sunIcon,
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
          items: bottomNavigationBarItems),
      body: prov.screens[prov.currentIndex],
    );
  }
}
