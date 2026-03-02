import 'package:deehelp/old_features/search/deboounce_search_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final debouncedSearchProvider =
    StateNotifierProvider.autoDispose<DebouncedSearchNotifier, String>(
  (ref) => DebouncedSearchNotifier(),
);

// final searchResultsProvider =
//     FutureProvider.autoDispose<List<IncidentOutput>>((ref) async {
//   final query = ref.watch(debouncedSearchProvider);

//   if (query.isEmpty) {
//     return [];
//   }

//   // Simula delay de rede
//   await Future.delayed(const Duration(milliseconds: 300));

//   return searchFromServer(query);
// });
