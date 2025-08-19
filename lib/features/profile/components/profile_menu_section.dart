import 'package:flutter/material.dart';
import 'package:yousafe/features/profile/profile_menu.dart';
import 'package:yousafe/features/profile/profile_menu_tile.dart';

import '../../../app/theme/app_colors.dart';

class ProfileMenuSection extends StatelessWidget {
  final List<ProfileMenu> items;
  const ProfileMenuSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(children: [
        ...items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isLast = index == items.length - 1;

          return Column(
            children: [
              ProfileMenuTile(item: item),
              if (!isLast)
                const Divider(
                  color: AppColors.border,
                  height: 1,
                  indent: 70,
                  endIndent: 24,
                ),
            ],
          );
        })
      ]),
    );
  }
}
