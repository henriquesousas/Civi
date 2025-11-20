import 'package:deehelp/core/components/custom_modal_bottom_sheet.dart';
import 'package:deehelp/features/profile/components/logout_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/resources.dart';
import '../../../core/theme/app_colors.dart';

class ProfileLogout extends StatelessWidget {
  const ProfileLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        onTap: () {
          customModalBottomSheet(
            context,
            // height: context.percentHeight(0.25),
            child: const LogoutModal(),
          );
        },
        minLeadingWidth: 24,
        leading: SvgPicture.asset(
          R.images.svgLogout,
          height: 24,
          width: 24,
          colorFilter: const ColorFilter.mode(
            AppColors.errorColor,
            BlendMode.srcIn,
          ),
        ),
        title: Text(
          R.strings.exitApp,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold, color: AppColors.errorColor),
        ),
      ),
    );
  }
}
