// import 'package:deehelp/feature/home/v2/home_page.dart';
import 'package:deehelp/feature/home/home_page4.dart';
import 'package:deehelp/feature/home/v2/teste_home.dart';
import 'package:deehelp/feature/home/v2/widgets/waze_alert.dart';
import 'package:deehelp/feature/items/list/item_list_page.dart';
import 'package:deehelp/feature/profile/profile_page.dart';
import 'package:deehelp/feature/search/search_page.dart';
import 'package:deehelp/feature/shell/bottom_nav.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/module/item/di/item_viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppShellPage extends ConsumerStatefulWidget {
  const AppShellPage({super.key});

  @override
  ConsumerState<AppShellPage> createState() => _AppShellPageState();
}

class _AppShellPageState extends ConsumerState<AppShellPage> {
  // ✅ controla “carregar uma única vez”
  bool _itemsLoadedOnce = false;
  int index = 0;
  late final List<Widget> _pages = const [
    // HomePage(), //  1
    EventsScreen(),
    // AlertDetailsScreen(),
    SearchPage(), // 2
    ItemListPage(), // 3
    ProfilePage(), // 4
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: IndexedStack(
            index: index,
            children: _pages,
          ),
          bottomNavigationBar: BottomNav(
            currentIndex: index,
            onChanged: (i) {
              setState(
                () => index = i,
              );

              // ✅ quando clicar em "Meus itens"
              if (i == 2) {
                final userId = ref.read(authenticatedUserProvider)?.id;
                if (userId == null) {
                  ref.read(itemListViewmodelProvider.notifier).clear();
                  _itemsLoadedOnce = false;
                  return;
                }
              }

              if (i == 2 && !_itemsLoadedOnce) {
                final userId = ref.read(authenticatedUserProvider)?.id;
                if (userId == null) {
                  return;
                }
                _itemsLoadedOnce = true;
                ref
                    .read(itemListViewmodelProvider.notifier)
                    .getProducts(userId);
              }
            },
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ValueListenableBuilder(
                  valueListenable: WazeAlertController.instance.notifier,
                  builder: (context, alert, _) {
                    if (alert == null) return const SizedBox.shrink();

                    return AnimatedTopToastCard(
                      ttl: const Duration(seconds: 50),
                      onClosed: WazeAlertController.instance.hide,
                      child: Wazelert(
                        title: 'Roubo registrado agora',
                        subtitle: 'há 12 min • Centro • 1,8 km de você',
                        onTap: () {
                          // abrir detalhes, navegar etc.
                        },
                        onClosed: WazeAlertController.instance.hide,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
