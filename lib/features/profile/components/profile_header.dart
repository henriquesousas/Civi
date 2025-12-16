import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/avatar/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/features/profile/components/profile_pro_indicator_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/theme/app_colors.dart';
import '../../../core/ui/theme/dimens.dart';
import '../../../core/ui/widgets/card/ui_custom_app_card.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? imageUrl;
  const ProfileHeader(
      {super.key, required this.name, required this.email, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      width: context.percentWidth(1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileImageWithUploadButtonWidget(
            imageUrl: imageUrl ?? '',
            imageAlt: "Profile",
            showUploadIcon: false,
            height: Dimens.profileImage.h,
            width: Dimens.profileImage.w,
            radius: Dimens.profileImageRadius.w,
          ),
          SizedBox(height: 5.h),
          Text(
            name,
            style: context.appTextStyles.sectionTitle,
          ),
          Text(
            email,
            style: context.appTextStyles.sectionBodyTextStyle.copyWith(
              color: AppColors.textColorBody,
            ),
          ),
          SizedBox(height: Dimens.size10.h),
          const ProfileProIndicatorBadge(),
        ],
      ),
    );
  }
}
