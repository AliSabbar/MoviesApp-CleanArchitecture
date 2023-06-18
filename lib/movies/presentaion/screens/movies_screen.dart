import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/movies/presentaion/widgets/movies_now_palying_widget.dart';
import 'package:movie_app/movies/presentaion/widgets/popular_movies_widget.dart';
import 'package:movie_app/movies/presentaion/widgets/top_rated_movies_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MoviesNowPlayingWidget(),
              const SizedBox(
                height: 15,
              ),
              Text(
                AppStrings.popularMovies,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              const PopularMoviesWidget(),
              const SizedBox(
                height: 20,
              ),
              Text(
                AppStrings.topRatedMovies,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              const TopRatedMoviesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
