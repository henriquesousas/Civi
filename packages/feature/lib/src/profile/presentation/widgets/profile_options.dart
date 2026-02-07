import 'package:app_core/app_core.dart';
import 'package:app_feature/src/profile/presentation/profile_item.dart';
import 'package:app_feature/src/profile/presentation/widgets/profile_tile.dart';
import 'package:flutter/material.dart';

class ProfileOptions extends StatelessWidget {
  final List<ProfileItem> items;

  const ProfileOptions({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: LayoutSpacingSize.page),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
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
                    const Divider(
                      height: 1,
                      indent: 72,
                      color: Color(0xFFE6EAF6),
                    ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
