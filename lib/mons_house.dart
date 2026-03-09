import 'package:flutter/material.dart';

class MounsHouse extends StatelessWidget {
  const MounsHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Stack(
        children: [
          /// Aqui ficaria seu mapa
          Positioned.fill(
            child: Container(
              color: const Color(0xFFE9EEF6),
            ),
          ),

          /// Card acima da bottom bar
          const Positioned(
            left: 16,
            right: 16,
            bottom: 92,
            child: LocationSummaryCard(
              title: "Mom's House",
              alertsText: "4 alerts past 24 hr",
            ),
          ),

          /// Bottom sheet fixa
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: HomeBottomSheetNav(
              currentIndex: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class LocationSummaryCard extends StatelessWidget {
  final String title;
  final String alertsText;
  final VoidCallback? onEditTap;

  const LocationSummaryCard({
    super.key,
    required this.title,
    required this.alertsText,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // const Text(
          //   '🏠',
          //   style: TextStyle(fontSize: 18),
          // ),
          const Text(
            '🔥',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  alertsText,
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onEditTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
                ),
              ),
              child: const Text(
                'Ver incidentes',
                style: TextStyle(
                  color: Color(0xFF374151),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBottomSheetNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const HomeBottomSheetNav({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      _BottomNavItemData(
        icon: Icons.map_outlined,
        activeIcon: Icons.map,
        label: 'Map',
      ),
      _BottomNavItemData(
        icon: Icons.language_outlined,
        activeIcon: Icons.language,
        label: 'News',
      ),
      _BottomNavItemData(
        icon: Icons.videocam_outlined,
        activeIcon: Icons.videocam,
        label: 'Go Live',
      ),
      _BottomNavItemData(
        icon: Icons.notifications_none_rounded,
        activeIcon: Icons.notifications_rounded,
        label: 'Alerts',
      ),
      _BottomNavItemData(
        icon: Icons.person_outline_rounded,
        activeIcon: Icons.person,
        label: 'You',
      ),
    ];

    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: MediaQuery.of(context).padding.bottom + 10,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final selected = currentIndex == index;

          return Expanded(
            child: InkWell(
              onTap: () => onTap?.call(index),
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      selected ? item.activeIcon : item.icon,
                      color: selected
                          ? const Color(0xFF2563EB)
                          : const Color(0xFF9CA3AF),
                      size: 22,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: selected
                            ? const Color(0xFF2563EB)
                            : const Color(0xFF9CA3AF),
                        fontSize: 11,
                        fontWeight:
                            selected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _BottomNavItemData {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const _BottomNavItemData({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
