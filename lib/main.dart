import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/theme/theme_data/dark_theme/dark_theme_data.dart';
import 'package:movie_app/core/theme/theme_data/light_theme/light_theme_data.dart';
import 'package:movie_app/home/presentaion/controller/home_provider.dart';

import 'home/presentaion/screens/home_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(homeProvider);
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: prov.isLight
          ? AppLightThemeData.getLightThemeData()
          : AppDarkThemeData.getDarkThemeData(),
      home: const HomeScreen(),
    );
  }
}
