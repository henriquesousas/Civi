import 'package:deehelp/old_core/services/network/network_info.dart';
import 'package:deehelp/old_core/services/network/network_info_provider.dart';
import 'package:deehelp/old_core/services/network/netwotk_alert_controller.dart';
import 'package:deehelp/feature/home/waze_alert.dart';
import 'package:deehelp/ui/profile/profile_page.dart';
import 'package:deehelp/v2/feature/feed/presentation/fedd_page.dart';
import 'package:deehelp/v2/feature/map/presentation/map_page.dart';
import 'package:deehelp/v2/feature/notification/presentation/notification_page.dart';
import 'package:deehelp/v2/feature/occurrence/send_alert/presentation/send_alert_page.dart';
import 'package:deehelp/v2/feature/shell/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainShellPage extends ConsumerStatefulWidget {
  const MainShellPage({super.key});

  @override
  ConsumerState<MainShellPage> createState() => _AppShellPageState();
}

class _AppShellPageState extends ConsumerState<MainShellPage> {
  int index = 0;
  late final List<Widget> _pages = const [
    FeedPage(),
    MapPage(),
    SendAlertPage(),
    NotificationPage(),
    ProfilePage(),
    // ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        currentIndex: index,
        onTap: (i) {
          setState(
            () {
              index = i;
            },
          );
        },
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: index,
            children: _pages,
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
      ),
    );
  }
}
