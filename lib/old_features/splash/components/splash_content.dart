import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../old_core/ui/animation/slide_fade_transition_animator.dart';
import '../../../old_core/resources.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideFadeTransitionAnimator(
      child: Column(
        children: [
          Text(
            R.strings.appName,
            style: context.appTextStyles.bodyTextStyle1.copyWith(
              // fontFamily: "MuseoModerno",
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
              fontSize: Dimens.size26.sp,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            R.strings.splashHeadline,
            textAlign: TextAlign.center,
            style: context.appTextStyles.sectionSubTitle1.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
