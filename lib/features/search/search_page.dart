import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/features/search/presentation/widgets/search_chip.dart';
import 'package:deehelp/features/search/presentation/widgets/search_info.dart';
import 'package:deehelp/features/search/presentation/widgets/search_item_list.dart';
import 'package:deehelp/features/search/presentation/widgets/search_loading_placeholder.dart';
import 'package:deehelp/features/search/presentation/widgets/topo_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(debouncedSearchProvider);
    final searchResultsAsync = ref.watch(searchResultsProvider);
    // final isLoading = ref.watch(isLoadingProvider);

    return UICustomScaffold(
      padding: EdgeInsets.zero,
      hideAppBar: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TopoSearch(),
              const SearchChip(),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: false,
                    child: searchResultsAsync.when(
                      loading: () =>
                          SearchLoadingPlaceholder(query: searchQuery),
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
