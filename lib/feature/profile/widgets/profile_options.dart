import 'package:deehelp/core/extension/color_extension.dart';
import '../profile_item.dart';
import 'profile_tile.dart';
import 'package:flutter/material.dart';

class ProfileOptions extends StatelessWidget {
  final List<ProfileItem> items;

  const ProfileOptions({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      // decoration: BoxDecoration(
      //   color: context.secondaryContainer,
      //   borderRadius: BorderRadius.circular(RadiusSize.lg),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Color(0x142B5BEE),
      //       blurRadius: 16,
      //       offset: Offset(0, 8),
      //     ),
      //   ],
      // ),
      decoration: BoxDecoration(
        color: const Color(0xFF101012),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF1D1D21),
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
                  if (entry.key != items.length - 1)
                    Divider(
                      height: 1,
                      indent: 72,
                      color: context.outlineVariantColor.withValues(alpha: 0.3),
                    ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
