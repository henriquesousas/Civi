import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/old_features/search/presentation/providers/debounce_search_provider.dart';
import 'package:deehelp/old_features/search/presentation/providers/search_viewmodel_provider.dart';
import 'package:deehelp/old_features/search/presentation/widgets/search_info.dart';
import 'package:deehelp/old_features/search/presentation/widgets/search_item_list.dart';
import 'package:deehelp/old_features/search/presentation/widgets/search_loading_placeholder.dart';
import 'package:deehelp/old_features/search/presentation/widgets/topo_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(debouncedSearchProvider);
    final searchViewModel = ref.watch(searchViewmodelProvider.notifier);
    final searchViewModelResult = ref.watch(searchViewmodelProvider);
    // final isLoading = ref.watch(isLoadingProvider);
    // final searchResultsAsync = ref.watch(searchResultsProvider);

    ref.listen(
      debouncedSearchProvider,
      (previous, currentQuery) {
        searchViewModel.search(currentQuery);
      },
    );

    return UICustomScaffold(
      bgColor: Theme.of(context).colorScheme.surface,
      // bgColor: AppColors.accent1,
      padding: EdgeInsets.zero,
      hideAppBar: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TopoSearch(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // color: AppColors.whiteColor,
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      width: 1,
                    ),
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: false,
                    child: searchViewModelResult.when(
                      loading: () => SearchLoadingPlaceholder(
                        query: searchQuery,
                      ),
                      error: (error, stack) => SearchInfo(
                        title: "Erro na busca",
                        error: error.toString(),
                        icon: const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        ),
                      ),
                      data: (results) {
                        if (searchQuery.isEmpty) {
                          return const SearchInfo(
                            title: "Buscar",
                            error: "Exemplo: ABC-1234 ou Toyota Corolla",
                            icon: Icon(
                              Icons.search_off,
                              color: AppColors.textSecondary,
                            ),
                          );
                        }

                        if (results.isEmpty) {
                          return SearchInfo(
                            title: "Nenhum resultado encontrado",
                            error:
                                'Tente buscar por "$searchQuery" de outra forma',
                            icon: const Icon(
                              Icons.inventory_2_outlined,
                              color: AppColors.textSecondary,
                            ),
                          );
                        }

                        return SearchItemList(results: results);
                      },
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
