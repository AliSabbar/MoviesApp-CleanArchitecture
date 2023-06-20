import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/theme/app_font_size/app_font_size.dart';
import 'package:movie_app/core/theme/app_icons/app_icons.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/widgets/error_message.dart';
import 'package:movie_app/core/utils/widgets/movie_card.dart';
import 'package:movie_app/search/presentation/controller/search_provider.dart';
import 'package:movie_app/search/presentation/widget/empty_search_widget.dart';

import '../../../core/utils/app_strings.dart';

class ResultOfSearch extends ConsumerWidget {
  const ResultOfSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(searchProvider);
    switch (prov.searchState.requestStates) {
      case RequestStates.loading:
        return prov.searchState.data.isEmpty
            ? const EmptySearchStateWidget(
                title: AppStrings.notSearchYet,
                icon: AppIcons.movieIcon,
              )
            : const Center(child: CircularProgressIndicator.adaptive());
      case RequestStates.loaded:
        return prov.searchState.data.isEmpty
            ? const EmptySearchStateWidget(
                icon: AppIcons.searchNotFoundIcon,
                title: AppStrings.noInformationFound)
            : ItemsLoaded(
                myList: prov.searchState.data,
              );
      case RequestStates.error:
        return ErrorMessage(
          message: prov.searchState.message,
        );
    }
  }
}

class ItemsLoaded extends StatelessWidget {
  const ItemsLoaded({super.key, required this.myList});

  final List myList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.67,
        ),
        itemCount: myList.length,
        itemBuilder: (BuildContext context, int index) {
          return DefaultCard(
              title: myList[index].mediaType == AppStrings.movie
                  ? myList[index].title
                  : myList[index].name,
              id: myList[index].id,
              voteAverage: myList[index].voteAverage,
              image: myList[index].image,
              type: myList[index].mediaType);
        },
      ),
    );
  }
}
