import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:deehelp/feature/home/widgets/thini_divider.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import '../profile_item.dart';
import 'profile_tile.dart';
import 'package:flutter/material.dart';

class ProfileOptions extends StatelessWidget {
  final List<ProfileItem> items;

  const ProfileOptions({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: SizeLayoutSpacing.m),
      decoration: BoxDecoration(
        // color: context.primaryBgCard,
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: context.outlineVariantColor.withValues(alpha: 1),
        ),
      ),
      child: Column(
        children: items
            .asMap()
            .entries
            .map(
              (entry) => Column(
                children: [
                  ProfileTile(
                    item: entry.value,
                    press: () => entry.value.press?.call(),
                  ),
                  if (entry.key != items.length - 1) const ThinDivider(),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
