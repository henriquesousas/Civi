import 'package:deehelp/feature/home/export_home.dart';
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
    HomePage(), // 1
    SearchPage(), // 2
    ItemListPage(), // 3
    ProfilePage(), // 4
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ref.read(itemListViewmodelProvider.notifier).zero();
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
            ref.read(itemListViewmodelProvider.notifier).getProducts(userId);
          }
        },
      ),
    );
  }
}
