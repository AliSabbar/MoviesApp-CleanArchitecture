import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/theme/app_color/app_colors.dart';
import 'package:movie_app/core/theme/app_icons/app_icons.dart';
import 'package:movie_app/search/presentation/controller/search_provider.dart';

class SearchAndClearWidget extends ConsumerWidget {
  const SearchAndClearWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(searchProvider);
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: TextField(
              controller: prov.searchController,
              onChanged: (value) {
                prov.searchItem(value: value);
              },
            )),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.redColor,
            ),
            onPressed: () {
              prov.clearSearch();
            },
            child: const Icon(
              AppIcons.clearIcon,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
