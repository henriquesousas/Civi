import 'package:deehelp/ui/profile/widgets/badge/item_badge.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

final badges = [
  "assets/images/badge_verified.png",
  "assets/images/badge_hero.png",
  "assets/images/sherifi_badge.png",
  "assets/images/badge_level_up.png",
  "assets/images/badge_verified.png",
  "assets/images/badge_hero.png",
];

class ProfileBadge extends StatelessWidget {
  const ProfileBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.m),
      child: GridView.builder(
        itemCount: badges.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.82,
        ),
        itemBuilder: (_, index) {
          return ItemBadge(
            urlBadge: badges[index],
            isUnlocked: true,
          );
        },
      ),
    );
  }
}
