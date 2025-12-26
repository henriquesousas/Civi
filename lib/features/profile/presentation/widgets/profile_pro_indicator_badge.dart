import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/theme/app_colors.dart';

class ProfileProIndicatorBadge extends StatelessWidget {
  const ProfileProIndicatorBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.defaultPadding,
        vertical: Dimens.defaultPadding / 2,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(Dimens.defaultRadius)),
      ),
      child: Text(
        "Pro",
        style: context.appTextStyles.caption2Style.copyWith(
          color: AppColors.whiteColor,
          fontFamily: "Grandis Extended",
        ),
      ),
    );
  }
}
