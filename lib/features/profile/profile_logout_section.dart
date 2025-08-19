import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

import '../../app/theme/app_colors.dart';
import '../../shared/components/buttons/secondary_outline_button.dart';

class ProfileLogoutSection extends StatelessWidget {
  const ProfileLogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Versão",
                  style: context.getTextStyle.smallMedium
                      .copyWith(color: AppColors.textSecondary),
                ),
                Text(
                  "1.0.0",
                  style: context.getTextStyle.small.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SecondaryOutlineButton(
            text: "Sair do aplicativo",
            borderColor: AppColors.error,
            textStyle: context.getTextStyle.smallMedium.copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
