import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/textfield/ui_text_field_rounded.dart';
import 'package:deehelp/features/search/presentation/providers/debounce_search_provider.dart';
import 'package:deehelp/features/search/presentation/providers/search_query_provider.dart';
import 'package:deehelp/features/search/presentation/providers/search_viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Future<List<IncidentOutput>> searchFromServer(String query) async {
//   // Simulação - substitua pela sua API real
//   await Future.delayed(const Duration(milliseconds: 500));

//   final allItems = [
//     IncidentOutput(
//       id: '',
//       userId: '',
//       alertId: '',
//       type: TypeAlert.immediately,
//       product: IncidentProductOutput(
//           productId: '', name: "name1", code: '', images: []),
//       local: IncidentLocal(address: "sasa", city: "sasaa", state: 'asasa'),
//       status: IncidentStatus.active,
//       createdAt: DateTime.now(),
//       occurredAt: DateTime.now(),
//       occurredAtTime: TimeOfDay.now(),
//     ),
//     IncidentOutput(
//       id: '',
//       userId: '',
//       alertId: '',
//       type: TypeAlert.immediately,
//       product: IncidentProductOutput(
//           productId: '', name: "name1", code: '', images: []),
//       local: IncidentLocal(address: "sasa", city: "sasaa", state: 'asasa'),
//       status: IncidentStatus.active,
//       createdAt: DateTime.now(),
//       occurredAt: DateTime.now(),
//       occurredAtTime: TimeOfDay.now(),
//     ),
//     IncidentOutput(
//       id: '',
//       userId: '',
//       alertId: '',
//       type: TypeAlert.immediately,
//       product: IncidentProductOutput(
//           productId: '', name: "name1", code: '', images: []),
//       local: IncidentLocal(address: "sasa", city: "sasaa", state: 'asasa'),
//       status: IncidentStatus.active,
//       createdAt: DateTime.now(),
//       occurredAt: DateTime.now(),
//       occurredAtTime: TimeOfDay.now(),
//     ),
//     IncidentOutput(
//       id: '',
//       userId: '',
//       alertId: '',
//       type: TypeAlert.immediately,
//       product: IncidentProductOutput(
//           productId: '', name: "name1 DND0171", code: 'DND0171', images: []),
//       local: IncidentLocal(address: "sasa", city: "sasaa", state: 'asasa'),
//       status: IncidentStatus.active,
//       createdAt: DateTime.now(),
//       occurredAt: DateTime.now(),
//       occurredAtTime: TimeOfDay.now(),
//     ),
//   ];

//   final list = allItems
//       .where(
//         (item) =>
//             item.product.name.toLowerCase().contains(query.toLowerCase()) ||
//             item.product.code.toLowerCase().contains(query.toLowerCase()),
//       )
//       .toList();

//   return list;
// }

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
    // final isLoading = ref.watch(isLoadingProvider);
    final searchQuery = ref.watch(debouncedSearchProvider);
    // ref.watch(searchQueryProvider);

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: UITextFieldRounded(
                contentPadding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20,
                ),
                borderRadius: 90,
                fillColor: Colors.grey[100],
                borderColor: Colors.grey[300],
                focusBorderColor: Colors.grey[300],
                // borderType: InputBorderType.none,
                showLabelText: false,
                labelText: "",
                hintText: "Digite aqui...",
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // suffixIcon: ref.watch(searchViewmodelProvider).when(
                //       data: (data) {
                //         return searchQuery.isNotEmpty
                //             ? IconButton(
                //                 icon: const Icon(Icons.close,
                //                     color: AppColors.textSecondary),
                //                 onPressed: () {

                //                 },
                //               )
                //             : null;
                //       },
                //       loading: () {
                //         return const SizedBox(
                //           height: 16,
                //           width: 16,
                //           child: CircularProgressIndicator(strokeWidth: 2),
                //         );
                //       },
                //       error: (_, __) => null,
                //     ),
                suffixIcon: searchQuery.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.textSecondary,
                        ),
                        onPressed: _clearSearch,
                      ),
                hintStyle: context.appTextStyles.bodyTextStyle2.copyWith(
                  color: AppColors.textTertiary,
                ),
                textStyle: context.appTextStyles.appBarTitle.copyWith(
                  color: AppColors.textColorBody,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) => _onSearchChanged(value),
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
