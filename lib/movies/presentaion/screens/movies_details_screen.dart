import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentaion/widgets/movie_details_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: MovieDetailsWidget(
        id: id,
      ),
    );
  }
}
