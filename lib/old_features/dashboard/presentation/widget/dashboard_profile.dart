import 'package:deehelp/old_core/ui/router/app_router.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/avatar/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/old_core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/module/external/di/authenticated_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DashboardProfile extends ConsumerWidget {
  const DashboardProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(authenticatedUserProvider);
    return session != null && session.photoUrl != null
        ? ProfileImageWithUploadButtonWidget(
            onTap: () => context.push(AppRouter.profile),
            imageUrl: session.name,
            imageAlt: session.name,
            showUploadIcon: false,
            height: Dimens.size40.h,
            width: Dimens.size40.w,
            radius: Dimens.profileImageRadius.w,
          )
        : UIICon(
            padding: 0,
            bgColor: AppColors.whiteColor,
            icon: IconButton(
              icon: const Icon(
                Icons.person,
                color: AppColors.darkGreyColor10,
              ),
              onPressed: () => context.push(AppRouter.profile),
            ),
            border: Border.all(
              color: AppColors.lightGreyColor30,
              width: 1,
            ),
          );
  }
}
