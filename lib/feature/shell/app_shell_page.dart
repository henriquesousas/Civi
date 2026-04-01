// import 'package:deehelp/feature/home/v2/home_page.dart';

import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/services/network/network_info.dart';
import 'package:deehelp/core/services/network/network_info_provider.dart';
import 'package:deehelp/core/services/network/netwotk_alert_controller.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/feature/auth/presentation/auth_router.dart';
import 'package:deehelp/feature/home/waze_alert.dart';
import 'package:deehelp/feature/items/list/item_list_page.dart';
import 'package:deehelp/feature/mapa/mapa_page.dart';
import 'package:deehelp/feature/profile/profile_page.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/module/item/di/item_viewmodel_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    // TesteHomePageAlert(),
    // EventsScreen(),
    // AlertDetailsScreen(),
    MapaPage(),
    // ItemListPage(),
    // SearchPage(), // 2
    ItemListPage(), // 3
    ProfilePage(), // 4
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            body: IndexedStack(
              index: index,
              children: _pages,
            ),
            bottomNavigationBar: _BottomNavBar(
              currentIndex: index,
              onChanged: (i) {
                setState(
                  () {
                    if (i == 1) {
                      final userId = ref.read(authenticatedUserProvider)?.id;
                      if (userId == null) {
                        context.push(AuthRouter.path);
                        return;
                      }
                    }
                    index = i;
                  },
                );

                // ✅ quando clicar em "Meus itens"
                if (i == 1) {
                  final userId = ref.read(authenticatedUserProvider)?.id;
                  if (userId == null) {
                    ref.read(itemListViewmodelProvider.notifier).clear();
                    _itemsLoadedOnce = false;
                    return;
                  }
                }

                if (i == 1 && !_itemsLoadedOnce) {
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
                        title: alert.title,
                        subtitle: alert.subtitle,
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
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: ValueListenableBuilder<bool>(
                valueListenable: NetworkAlertController.instance.notifier,
                builder: (context, isOffline, _) {
                  if (!isOffline) return const SizedBox.shrink();

                  return AnimatedTopToastCard(
                    ttl: const Duration(days: 1), // não some sozinho
                    onClosed: NetworkAlertController.instance.hide,
                    child: NoInternetCard(
                      onRetry: () async {
                        final hasConnection =
                            await ref.read(networkInfoProvider).hasConnection;

                        if (hasConnection) {
                          NetworkAlertController.instance.hide();
                        }
                      },
                      onClose: NetworkAlertController.instance.hide,
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onChanged;
  const _BottomNavBar({
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final items = const [
      _NavItem(
        icon: CupertinoIcons.map,
        activeIcon: CupertinoIcons.map_fill,
        label: 'Mapa',
        selected: false,
      ),
      // _NavItem(
      //   icon: CupertinoIcons.search,
      //   activeIcon: CupertinoIcons.search,
      //   label: 'Home',
      //   selected: true,
      // ),
      _NavItem(
        icon: CupertinoIcons.cube,
        activeIcon: CupertinoIcons.cube_box_fill,
        label: 'Meus itens',
        selected: false,
      ),
      _NavItem(
        icon: CupertinoIcons.person,
        activeIcon: CupertinoIcons.person_fill,
        label: 'Perfil',
        selected: false,
      ),
    ];
    return Container(
      height: 86,
      decoration: const BoxDecoration(
        color: Color(0xFF040404),
        border: Border(
          top: BorderSide(color: Color(0xFF1C1C1E), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) {
            final item = items[index];
            final selected = currentIndex == index;

            return Expanded(
              child: InkWell(
                onTap: () => onChanged?.call(index),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        selected ? item.activeIcon : item.icon,
                        color: selected
                            ? context.primaryTextColor
                            // : const Color(0xFF9CA3AF),
                            : context.secondaryTextColor,
                        size: IconSizes.md,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: context.appText.button.copyWith(
                          color: selected
                              ? context.primaryTextColor
                              : context.secondaryTextColor,
                          // : const Color(0xFF9CA3AF),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool selected;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.red : const Color(0xFFA1A1A8);

    return SizedBox(
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 6),
          Text(
            "Ola",
            style: TextStyle(
              color: color,
              fontSize: context.safeSp(13),
              fontWeight: selected ? FontWeight.w800 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// class HomeBottomSheetNav extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int>? onChanged;

//   const HomeBottomSheetNav({
//     super.key,
//     required this.currentIndex,
//     this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const items = [
//       _BottomNavItemData(
//         icon: Icons.public,
//         activeIcon: Icons.public_outlined,
//         label: 'Mapa',
//       ),
//       _BottomNavItemData(
//         icon: Icons.search,
//         activeIcon: Icons.search,
//         label: 'Buscar',
//       ),
//       _BottomNavItemData(
//         icon: Icons.inventory_2_outlined,
//         activeIcon: Icons.inventory_2_rounded,
//         label: 'Items',
//       ),
//       _BottomNavItemData(
//         icon: Icons.person_outline_rounded,
//         activeIcon: Icons.person,
//         label: 'Perfil',
//       ),
//     ];

//     return Container(
//       padding: EdgeInsets.only(
//         left: 10,
//         right: 10,
//         top: 10,
//         bottom: MediaQuery.of(context).padding.bottom + 10,
//       ),
//       decoration: BoxDecoration(
//         // color: Colors.white,
//         // color: context.surfaceColor,
//         color: Theme.of(context).scaffoldBackgroundColor,
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(28),
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x14000000),
//             blurRadius: 18,
//             offset: Offset(0, -4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: List.generate(
//           items.length,
//           (index) {
//             final item = items[index];
//             final selected = currentIndex == index;

//             return Expanded(
//               child: InkWell(
//                 onTap: () => onChanged?.call(index),
//                 borderRadius: BorderRadius.circular(16),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 6),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         selected ? item.activeIcon : item.icon,
//                         color: selected
//                             ? context.onSurfaceVariant
//                             // : const Color(0xFF9CA3AF),
//                             : context.onSurface.withValues(alpha: 0.8),
//                         size: IconSizes.lg,
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         item.label,
//                         style: context.appText.label.copyWith(
//                           color: selected
//                               ? context.onSurfaceVariant
//                               : context.onSurface.withValues(alpha: 0.8),
//                           // : const Color(0xFF9CA3AF),
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class _BottomNavItemData {
//   final IconData icon;
//   final IconData activeIcon;
//   final String label;

//   const _BottomNavItemData({
//     required this.icon,
//     required this.activeIcon,
//     required this.label,
//   });
// }
