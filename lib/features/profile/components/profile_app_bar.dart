import 'package:deehelp/core/ui/image/ui_network_image.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../title_collapsing.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
// TODO: Ter um usecase pra buscar essas informacoes (seguir bas práticas)
    final user = FirebaseAuth.instance.currentUser;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: context.percentHeight(0.3),
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: AppColors.primary,
      flexibleSpace: FlexibleSpaceBar(
        title: CollapsingTitle(
          title: user?.displayName ?? '',
          photoUrl: user?.photoURL ?? '',
        ),
        background: Container(
          decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 30),
                if (user?.photoURL == null)
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                if (user?.photoURL?.isNotEmpty == true)
                  UINetworkImage(imageUrl: user?.photoURL ?? ''),
                const SizedBox(height: 10),
                Text(
                  user?.displayName ?? '',
                  style: context.textRegularMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user?.email ?? '',
                  style: context.textSmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                // const UIVerificationFlag(isVerified: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
