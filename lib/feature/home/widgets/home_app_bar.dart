import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/core/ui/widgets/buttons/button_profile.dart';
import 'package:deehelp/core/ui/widgets/image/profile_image_with_upload.dart';
import 'package:deehelp/feature/auth/presentation/auth_router.dart';
import 'package:deehelp/module/auth/external/di/authenticated_user_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  // final String userName;
  // final String profileImageUrl;
  final String? region;
  final VoidCallback press;

  const HomeAppBar({
    super.key,
    required this.press,
    required this.region,
  });

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticatedUser = ref.watch(authenticatedUserProvider);

    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      elevation: 1,
      toolbarHeight: 74,
      scrolledUnderElevation: 0.6,
      backgroundColor: context.surfaceColor,
      surfaceTintColor: context.surfaceColor,
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      title: Row(
        children: [
          if (authenticatedUser != null) ...[
            // HomeAvatarBadge(
            //   initials: "PS",
            //   onTap: press,
            // ),
            ProfileImageWithUploadButtonWidget(
              imageUrl: authenticatedUser.photoUrl,
              imageAlt: authenticatedUser.name,
              onTap: press,
            )
          ] else ...[
            ButtonProfile(
              onTap: () => context.push(AuthRouter.path),
            )
          ],
          const SizedBox(width: SpacingSize.md),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Roubos na região',
                  style: context.appTextOld.bodymd.copyWith(
                    color: context.onSurface,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: SpacingSize.xxs),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: IconSizes.xs,
                      color: context.secondaryColor,
                    ),
                    Expanded(
                      child: Text(
                        region != null ? region! : "Bem vindo",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.appTextOld.bodySmall,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
