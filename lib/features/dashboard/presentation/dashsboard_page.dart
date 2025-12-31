import 'package:deehelp/core/router/app_router.dart';
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/avatar/profile_image_with_upload_button_widget.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_scaffold.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:deehelp/features/auth/presentation/session/session_provider.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashboard_search_container.dart';
import 'package:deehelp/features/dashboard/presentation/widget/dashbord_quick_actions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DashsboardPage extends ConsumerWidget {
  const DashsboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(userSessionProvider);
    return UICustomScaffold(
      hideAppBar: true,
      body: Column(
        children: [
          SizedBox(height: context.topPadding),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (session != null && session.photoUrl != null) ...[
                    ProfileImageWithUploadButtonWidget(
                      onTap: () => context.push(AppRouter.profile),
                      imageUrl: session.name,
                      imageAlt: session.name,
                      showUploadIcon: false,
                      height: Dimens.size40.h,
                      width: Dimens.size40.w,
                      radius: Dimens.profileImageRadius.w,
                    ),
                  ],
                  if (session == null) ...[
                    UIICon(
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
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '[LABEL]',
                          style: context.appTextStyles.sectionTitle
                              .copyWith(fontSize: 22.sp),
                        ),
                        SizedBox(height: 20.h),
                        const DashboardSearchContainer()
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Aqui aparecerá as ocorrências que foram \nregistradas nas últimas horasssa.",
                      style: context.appTextStyles.sectionSubTitle1
                          .copyWith(letterSpacing: 1.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const DashbordQuickActionsCard()
        ],
      ),
    );
  }
}
