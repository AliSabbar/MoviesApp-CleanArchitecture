import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/general_states.dart';
import 'package:movie_app/search/domain/usecases/search_usecase.dart';

class SearchProvider extends ChangeNotifier {
  GeneralStates searchState = GeneralStates();
  TextEditingController searchController = TextEditingController();
  search({required SearchParameters parameters}) async {
    final result = await SearchUseCase(baseSearchRepository: sl())
        .call(SearchParameters(query: parameters.query));
    result.fold(
        (l) => searchState = GeneralStates(
            message: l.message, requestStates: RequestStates.error),
        (r) => searchState =
            GeneralStates(data: r, requestStates: RequestStates.loaded));

    notifyListeners();
  }

  searchItem({required String value}) {
    if (value.isEmpty) {
      searchState = GeneralStates(data: []);
      notifyListeners();
    } else {
      search(parameters: SearchParameters(query: value));
      notifyListeners();
    }
  }

  clearSearch() {
    searchController.clear();
    searchState = GeneralStates(data: []);
    notifyListeners();
  }
}

final searchProvider = ChangeNotifierProvider((ref) => SearchProvider());
