import 'package:flutter/material.dart';
import 'package:yousafe/features/favorites/components/ui_verification_flag.dart';
import 'package:yousafe/shared/extensions/screen_size_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import '../../../app/theme/app_colors.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.percentHeight(0.3),
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: AppColors.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                Text(
                  "Jhon Doe",
                  style: context.getTextStyle.regular.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: context.responsiveText(0.07),
                  ),
                ),
                Text(
                  "Membro desde Março de 2023",
                  style: context.getTextStyle.small.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const UIVerificationFlag(isVerified: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
