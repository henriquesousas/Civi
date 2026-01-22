import 'dart:async';

import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:deehelp/features/search/deboounce_search_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResult {
  final String id;
  final String title;
  final String subtitle;
  final String? icon;

  SearchResult({
    required this.id,
    required this.title,
    required this.subtitle,
    this.icon,
  });
}

final debouncedSearchProvider =
    StateNotifierProvider<DebouncedSearchNotifier, String>(
  (ref) => DebouncedSearchNotifier(),
);

final searchResultsProvider =
    FutureProvider.autoDispose<List<SearchResult>>((ref) async {
  final query = ref.watch(debouncedSearchProvider);

  if (query.isEmpty) {
    return [];
  }

  // Simula delay de rede
  await Future.delayed(const Duration(milliseconds: 300));

  return _searchFromServer(query);
});

final isLoadingProvider = Provider.autoDispose<bool>((ref) {
  final query = ref.watch(debouncedSearchProvider);
  final asyncValue = ref.watch(searchResultsProvider);

  // Está carregando se há query e ainda não terminou
  return query.isNotEmpty && asyncValue.isLoading;
});

final searchQueryProvider = StateProvider<String>((ref) => '');

Future<List<SearchResult>> _searchFromServer(String query) async {
  // Simulação - substitua pela sua API real
  await Future.delayed(const Duration(milliseconds: 500));

  final allItems = [
    SearchResult(
      id: '1',
      title: 'CG titan 125 Cilindrada',
      subtitle: 'Carapicuiba, São Paulo',
    ),
    SearchResult(
      id: '2',
      title: 'Toyota Corolla 2020',
      subtitle: 'São Paulo, SP',
    ),
    SearchResult(
      id: '3',
      title: 'ABC-1234',
      subtitle: 'Placa registrada',
    ),
  ];

  final list = allItems
      .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
      .toList();

  return list;
}

class TopoSearch extends ConsumerStatefulWidget {
  const TopoSearch({super.key});

  @override
  ConsumerState<TopoSearch> createState() => _TopoSearchState();
}

class _TopoSearchState extends ConsumerState<TopoSearch> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();

    // Inicializa com valor atual do provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentQuery = ref.read(debouncedSearchProvider);
      _controller.text = currentQuery;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    // Usa o notifier para debounce
    ref.read(debouncedSearchProvider.notifier).updateQuery(value);
  }

  void _handleSubmitted(String value) {
    // Força busca imediata ao pressionar Enter
    if (value.isNotEmpty) {
      ref.read(debouncedSearchProvider.notifier).updateImmediately(value);
    }
  }

  void _clearSearch() {
    _controller.clear();
    ref.read(debouncedSearchProvider.notifier).clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    // final isLoading = ref.watch(isLoadingProvider);
    // final searchQuery = ref.watch(searchQueryProvider);
    final isLoading = ref.watch(isLoadingProvider);
    return Container(
      padding: EdgeInsets.only(
        top: context.topPadding + 8,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.textSecondary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: UITextFieldRounded(
              borderRadius: 90,
              fillColor: Colors.transparent, // Colors.grey[100],
              borderColor: Colors.transparent, //Colors.grey[300],
              focusBorderColor: Colors.transparent, //Colors.grey[600],
              borderType: InputBorderType.none,
              showLabelText: false,
              labelText: "",
              hintText: "Ex: ABC-1234 ou Toyota Corolla",
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: _clearSearch,
                    )
                  : null,
              hintStyle: context.appTextStyles.bodyTextStyle2.copyWith(
                color: AppColors.textTertiary,
              ),
              textStyle: context.appTextStyles.bodyTextStyle2.copyWith(
                color: AppColors.textColorBody,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) => _onSearchChanged(value),
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
