import 'dart:ui';

import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/utils/navigation_utils.dart';
import 'package:deehelp/feature/items/detail/provider/selected_item_provider.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/items/list/list_product_state.dart';
import 'package:deehelp/feature/items/list/item_listing_args.dart';
import 'package:deehelp/feature/items/list/widgets/item_list_view.dart';
import 'package:deehelp/feature/search/widgets/load_skeleton.dart';
import 'package:deehelp/business/auth/di/loggued_user_provider.dart';
import 'package:deehelp/module/item/di/item_viewmodel_provider.dart';
import 'package:deehelp/core/ui/widgets/empty/empty_state_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    fetchData();
  }

  Future<void> fetchData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = ref.read(logguedUserProvider)?.id;
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

  Future<void> _onRefresh() async {
    final userId = ref.read(logguedUserProvider)?.id;
    debugPrint("UserId $userId");
    if (userId == null) {
      ref.read(itemListViewmodelProvider.notifier).clear();
      return;
    }

    ref.read(itemListViewmodelProvider.notifier).getProducts(
          userId,
          fetchData: true,
        );
  }

  @override
  Widget build(BuildContext context) {
    // final authenticatesUser = ref.read(authenticatedUserProvider);
    final state = ref.watch(itemListViewmodelProvider);
    return Scaffold(
      // bottomNavigationBar: _bottomBar(state),
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: DefaultAppBar(
        title: "Meus itens",
        showBackButton: widget.showBackButton ?? false,
        press: () => context.pop(),
      ),
      body: state.maybeMap(
        success: (value) => ItemListView(
          onRefresh: () async {
            await _onRefresh();
          },
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

        // success: (value) => const LoadingResultsSkeletonV2(),
        // success: (value) => Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: EmptyStateWidget(
        //     highlightIcon: Icon(
        //       CupertinoIcons.exclamationmark_circle,
        //       size: IconSizes.xl,
        //       color: context.primaryColor,
        //     ),
        //     title: 'Algo deu errado',
        //     subtitle:
        //         'Não conseguimos carregar seus itens agora. Tente novamente em instantes.',
        //     buttonText: "Tentar novamente",
        //     onRetry: () {
        //       fetchData();
        //     },
        //   ),
        // ),
        // // loading: (_) => const ItemListShimmer(),
        // loading: (_) => const LoadingResultsSkeletonV2(),
        // noInternet: (value) => EmptyStateWidget(
        //   highlightIcon: Icon(
        //     Icons.inventory_2_outlined,
        //     size: IconSizes.xl,
        //     color: context.primaryColor,
        //   ),
        //   title: 'Sem conexão de rede :()',
        //   subtitle:
        //       'Por favor verifique sua conexão e tente novamente mais tarde!',
        //   buttonText: "Tentar de novo",
        //   onRetry: () {
        //     fetchData();
        //   },
        // ),
        empty: (value) {
          if (widget.args != null) {
            return NoRegisteredItemBottomSheet(
              onRegisterTap: () {
                context.pop();
                context.push(ItemsRouter.register);
              },
            );
          }

          return Padding(
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
              onRetry: () {
                final router =
                    NavigationUtils.safeNavigation(ItemsRouter.register, ref);
                context.push(router);
              },
            ),
          );
        },
        error: (value) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: EmptyStateWidget(
              highlightIcon: Icon(
                CupertinoIcons.exclamationmark_circle,
                size: IconSizes.xl,
                color: context.primaryColor,
              ),
              title: 'Algo deu errado',
              subtitle:
                  'Não conseguimos carregar seus itens agora. Tente novamente em instantes.',
              buttonText: "Tentar novamente",
              onRetry: () {
                fetchData();
              },
            ),
          );
        },
        orElse: () {
          return const LoadingResultsSkeletonV2();
        },
      ),
    );
  }
}

class NoRegisteredItemBottomSheet extends StatelessWidget {
  final VoidCallback onRegisterTap;

  const NoRegisteredItemBottomSheet({
    super.key,
    required this.onRegisterTap,
  });

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onRegisterTap,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (_) => NoRegisteredItemBottomSheet(
        onRegisterTap: onRegisterTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, bottom + 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
              decoration: BoxDecoration(
                // color: const Color(0xFF111315).withValues(alpha: 0.96),
                color: context.primaryBgCard.withValues(alpha: 0.96),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: context.outlineVariantColor,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 24,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Container(
                    //   width: 42.w,
                    //   height: 5.h,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white.withValues(alpha: 0.16),
                    //     borderRadius: BorderRadius.circular(999),
                    //   ),
                    // ),
                    const SizedBox(height: 22),
                    Container(
                      width: 72.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB020).withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color:
                              const Color(0xFFFFB020).withValues(alpha: 0.24),
                        ),
                      ),
                      child: Icon(
                        CupertinoIcons.checkmark_shield,
                        size: 34.w,
                        color: const Color(0xFFFFB020),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Nenhum item cadastrado ainda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: context.primaryTextColor,
                        fontSize: context.safeSp(18),
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Para continuar, você precisa cadastrar um item e aguardar a verificação da equipe Civi. Após a aprovação, ele poderá ser usado em ocorrências e alertas.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            context.secondaryTextColor.withValues(alpha: 0.72),
                        fontSize: context.safeSp(13),
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: context.primaryBgCardHigh.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.07),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            CupertinoIcons.info_circle,
                            size: 18.w,
                            color: colorScheme.primary.withValues(alpha: 0.9),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'A verificação ajuda a manter a segurança e a confiabilidade das informações dentro da comunidade Civi.',
                              style: TextStyle(
                                color: context.primaryTextColor
                                    .withValues(alpha: 0.66),
                                fontSize: context.safeSp(11),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: onRegisterTap,
                        child: const Text(
                          'Cadastrar novo item',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white.withValues(alpha: 0.72),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Agora não',
                          style: TextStyle(
                            fontSize: context.safeSp(13),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
