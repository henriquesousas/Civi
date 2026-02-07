import 'package:app_core/app_core.dart';
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
          ProfileImageWithUploadButtonWidget(
            imageUrl: profileImageUrl,
            imageAlt: "Fake name",
            onTap: press,
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
