import 'package:deehelp/features/search/presentation/providers/debounce_search_provider.dart';
import 'package:deehelp/features/search/presentation/providers/search_viewmodel_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoadingProvider = Provider.autoDispose<bool>((ref) {
  final query = ref.watch(debouncedSearchProvider);
  // final asyncValue = ref.watch(searchResultsProvider);
  final asyncValue = ref.watch(searchViewmodelProvider);

  // Está carregando se há query e ainda não terminou
  return query.isNotEmpty && asyncValue.isLoading;
});
