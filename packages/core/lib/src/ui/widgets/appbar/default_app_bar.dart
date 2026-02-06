import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String profileImageUrl;

  const DefaultAppBar({
    super.key,
    required this.userName,
    required this.profileImageUrl,
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
          CustomNetworkImage(
            radius: RadiusSize.xxl,
            imageUrl: profileImageUrl,
          ),
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bom dia,', style: context.appText.body),
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
