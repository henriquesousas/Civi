import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';

import 'home_avatar_badge.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String profileImageUrl;
  final VoidCallback press;

  const HomeAppBar({
    super.key,
    required this.userName,
    required this.profileImageUrl,
    required this.press,
  });

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      toolbarHeight: 74,
      scrolledUnderElevation: 0.6,
      backgroundColor: context.surfaceColor,
      surfaceTintColor: context.surfaceColor,
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      title: Row(
        children: [
          // ProfileImageWithUploadButtonWidget(
          //   imageUrl: profileImageUrl,
          //   imageAlt: "Fake name",
          //   onTap: press,
          // ),
          HomeAvatarBadge(
            initials: "PS",
            onTap: press,
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Olá,', style: context.appText.caption),
                const SizedBox(height: 2),
                Text(
                  userName,
                  style: context.appText.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
