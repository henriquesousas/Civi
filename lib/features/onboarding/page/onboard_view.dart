import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/features/onboarding/page/onboard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/res/resources.dart';
import '../../../core/ui/theme/app_colors.dart';
import '../../../core/ui/theme/dimens.dart';
import '../../../core/ui/widgets/button/ui_elevated_button.dart';
import 'components/onboard_page_indicator.dart';

class OnboardView extends StatelessWidget {
  final int currentPage;
  final bool isLoading;
  final bool isLoadingAuthWithoutAccount;
  final VoidCallback pressLoginWithGoogle;
  final VoidCallback pressEnterWithoutLogin;
  const OnboardView({
    super.key,
    required this.currentPage,
    required this.pressLoginWithGoogle,
    required this.pressEnterWithoutLogin,
    this.isLoading = false,
    this.isLoadingAuthWithoutAccount = false,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.percentHeight(0.05),
      left: context.percentHeight(0.02),
      right: context.percentHeight(0.02),
      child: Column(
        spacing: 10,
        children: [
          OnboardPageIndicator(
            currentPage: currentPage % OnboardItem.pages().length,
            totalPage: OnboardItem.pages().length,
          ),
          const SizedBox(height: Dimens.size10),
          UIElevatedButton(
            text: R.strings.enterWithGoogle,
            isLoading: isLoading,
            icon: SvgPicture.asset(
              R.svg.google,
              width: 20.w,
              height: 20.h,
            ),
            press: pressLoginWithGoogle,
          ),
          UIElevatedButton(
            text: R.strings.continueWithoutLogin,
            isLoading: isLoadingAuthWithoutAccount,
            borderColor: AppColors.primaryColor,
            bgColor: AppColors.whiteColor,
            textColor: AppColors.primaryColor,
            press: pressEnterWithoutLogin,
          ),
        ],
      ),
    );
  }
}
