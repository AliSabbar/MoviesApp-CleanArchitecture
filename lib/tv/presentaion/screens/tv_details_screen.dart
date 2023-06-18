
import 'package:flutter/material.dart';
import 'package:movie_app/tv/presentaion/widgets/tv_details_widget.dart';

class TvDetailsScreen extends StatelessWidget {
  const TvDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TvDetailsWidget(id: id));
  }
}

