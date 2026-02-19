import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/feature/items/detail/provider/selected_item_provider.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/items/list/item_list_state.dart';
import 'package:deehelp/feature/items/list/widgets/item_list_shimmer.dart';
import 'package:deehelp/feature/items/list/widgets/item_list_view.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/module/item/di/item_viewmodel_provider.dart';
import 'package:deehelp/old_core/ui/widgets/empty/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ItemListPage extends ConsumerStatefulWidget {
  const ItemListPage({super.key});

  @override
  ConsumerState<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends ConsumerState<ItemListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = ref.watch(authenticatedUserProvider)?.id;
      ref.read(itemListViewmodelProvider.notifier).getProducts(userId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemListViewmodelProvider);
    return Scaffold(
      bottomNavigationBar: _bottomBar(state),
      appBar: DefaultAppBar(
        title: "Meus itens",
        press: () => context.pop(),
      ),
      body: state.maybeMap(
        success: (value) => ItemListView(
          items: value.items,
          press: (item) async {
            ref.watch(selectedItemProvider.notifier).state = item;
            await context.push<Map<String, dynamic>?>(
              ItemsRouter.detail,
              extra: item,
            );

            final current = ref.watch(selectedItemProvider.notifier).state;
            ref.watch(itemListViewmodelProvider.notifier).refresh(current!);
          },
        ),
        loading: (_) => const ItemListShimmer(),
        orElse: () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: EmptyStateWidget(
            highlightIcon: Icon(
              Icons.inventory_2_outlined,
              size: IconSizes.xl,
              color: context.primaryColor,
            ),
            title: 'Nenhum item cadastrado',
            subtitle:
                'Cadastre seu carro, moto ou celular para protegê-los e ajudar a comunidade em caso de roubo.',
            buttonText: "Cadastrar item",
            onRegisterItem: () => context.push(ItemsRouter.register),
          ),
        ),
      ),
    );
  }

  Widget? _bottomBar(ListProductState state) {
    return state.maybeMap(
      success: (value) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x142B5BEE),
                blurRadius: 16,
                offset: Offset(0, -6),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: ButtonOutline(
              press: () => context.push(ItemsRouter.register),
              bgColor: context.primaryColor,
              textColor: Colors.white,
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
              text: "Cadastrar novo item",
            ),
          ),
        );
      },
      orElse: () => null,
    );
  }
}
