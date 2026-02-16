import 'package:deehelp/old_core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/avatar/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/old_core/ui/widgets/button/ui_elevated_button.dart';
import 'package:deehelp/old_core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/module/external/di/authenticated_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final session = ref.watch(userSessionProvider);
    // final session = ref.watch(authenticatedUserProvider);
    final session = null;

    return SizedBox(
      width: context.percentWidth(1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (session == null) ...[
            UIICon(
              bgColor: AppColors.primaryColor, //Colors.deepPurple,
              icon: IconButton(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: AppColors.whiteColor,
                  size: 42.w,
                ),
                onPressed: () {},
              ),
              border: Border.all(
                color: AppColors.lightGreyColor30,
                width: 1,
              ),
            ),
            const SizedBox(height: 10),
            UIElevatedButton(
              borderColor: AppColors.primaryColor,
              bgColor: Colors.transparent,
              textColor: AppColors.primaryColorDark,
              width: context.percentWidth(0.3),
              text: "Entrar",
              press: () {},
            )
          ],
          if (session != null) ...[
            ProfileImageWithUploadButtonWidget(
              imageUrl: session.name,
              imageAlt: session.name,
              showUploadIcon: false,
              height: Dimens.profileImage.h,
              width: Dimens.profileImage.w,
              radius: Dimens.profileImageRadius.w,
            ),
            SizedBox(height: 5.h),
            Text(
              session.name,
              style: context.appTextStyles.sectionTitle
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Text(
              session.email,
              style: context.appTextStyles.sectionBodyTextStyle.copyWith(
                color: Theme.of(context).colorScheme.surfaceDim,
              ),
            ),
            SizedBox(height: Dimens.size10.h),
            // const ProfileProIndicatorBadge(),
          ],
        ],
      ),
    );
  }
}
