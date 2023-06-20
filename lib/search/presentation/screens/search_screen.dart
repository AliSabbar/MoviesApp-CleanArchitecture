import 'package:flutter/material.dart';
import 'package:movie_app/search/presentation/widget/result_of_search.dart';
import 'package:movie_app/search/presentation/widget/search_and_clear_widget.dart';



class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
               SearchAndClearWidget(),
               SizedBox(
                height: 30,
              ),
              ResultOfSearch(),
            ],
          ),
        ),
      ),
    );
  }
}



