import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/core/utils/navigation_utils.dart';
import 'package:deehelp/feature/items/detail/provider/selected_item_provider.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/items/list/item_list_state.dart';
import 'package:deehelp/feature/items/list/item_listing_args.dart';
import 'package:deehelp/feature/items/list/widgets/item_list_view.dart';
import 'package:deehelp/feature/search/widgets/load_skeleton.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/module/item/di/item_viewmodel_provider.dart';
import 'package:deehelp/core/ui/widgets/empty/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ItemListPage extends ConsumerStatefulWidget {
  final ItemListingArgs? args;
  final bool? showBackButton;
  const ItemListPage({
    super.key,
    this.args,
    this.showBackButton = false,
  });

  @override
  ConsumerState<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends ConsumerState<ItemListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = ref.read(authenticatedUserProvider)?.id;
      debugPrint("UserId $userId");
      if (userId == null) {
        ref.read(itemListViewmodelProvider.notifier).clear();
        return;
      }

      ref.read(itemListViewmodelProvider.notifier).getProducts(
            userId,
            fetchData: widget.args?.fetchData ?? false,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemListViewmodelProvider);
    return Scaffold(
      // bottomNavigationBar: _bottomBar(state),
      appBar: DefaultAppBar(
        title: "Meus itens",
        showBackButton: widget.showBackButton ?? false,
        press: () => context.pop(),
      ),
      body: state.maybeMap(
        success: (value) => ItemListView(
          items: value.items,
          press: (item) async {
            if (widget.args != null && widget.args!.isAddingIncident) {
              context.pop(item);
              return;
            }

            ref.watch(selectedItemProvider.notifier).state = item;
            final result = await context.push<Map<String, dynamic>?>(
              ItemsRouter.detail,
              extra: item,
            );

            final current = ref.watch(selectedItemProvider.notifier).state;
            if (result != null) {
              final operation = result['args']['operation'] as String;
              // final status = result['args']['status'] as bool;
              /*Refatorar para nao usar o valores fixos pois podem mudar
              este operation esta vindo da tela de detalhes*/
              if (operation == 'delete') {
                ref
                    .watch(itemListViewmodelProvider.notifier)
                    .removeAt(current!);
              }
            } else {
              ref.watch(itemListViewmodelProvider.notifier).refresh(current!);
            }
          },
        ),
        // loading: (_) => const ItemListShimmer(),
        loading: (_) => const LoadingResultsSkeletonV2(),
        orElse: () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: EmptyStateWidget(
            highlightIcon: Icon(
              Icons.inventory_2_outlined,
              size: IconSizes.xl,
              color: context.primaryColor,
            ),
            title: 'Você ainda não cadastrou nenhum item',
            subtitle:
                'Cadastre seu carro, moto ou celular para acompanhar ocorrências e receber alertas relacionados.',
            buttonText: "Cadastrar item",
            onRegisterItem: () {
              final router =
                  NavigationUtils.safeNavigation(ItemsRouter.register, ref);
              context.push(router);
            },
          ),
        ),
      ),
    );
  }

  // Widget? _bottomBar(ListProductState state) {
  //   return state.maybeMap(
  //     success: (value) {
  //       return Container(
  //         padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
  //         decoration: const BoxDecoration(
  //           // color: context.surfaceColor,
  //           boxShadow: [
  //             BoxShadow(
  //               color: Color(0x142B5BEE),
  //               blurRadius: 16,
  //               offset: Offset(0, -6),
  //             ),
  //           ],
  //         ),
  //         child: SafeArea(
  //           top: false,
  //           child: ButtonOutline(
  //             press: () {
  //               context.push(ItemsRouter.register);
  //             },
  //             borderColor: context.primaryColor,
  //             bgColor: context.primaryColor,
  //             // textColor: Colors.white,
  //             icon: Icon(
  //               Icons.add_circle_outline,
  //               color: context.surfaceColor,
  //             ),
  //             text: "Cadastrar novo item",
  //           ),
  //         ),
  //       );
  //     },
  //     orElse: () => null,
  //   );
  // }
}
