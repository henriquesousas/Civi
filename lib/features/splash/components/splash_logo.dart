import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/ui/animation/transform_scale_opacity_animator.dart';
import '../../../core/ui/assets/resources.dart';
import '../../../core/ui/widgets/pin/ui_custom_pin.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return TransformScaleOpacityAnimator(
      duration: const Duration(milliseconds: 1500),
      child: Center(
        child: UICustomPin(
          size: Dimens.size90.w,
          tailHeight: 12,
          roundness: 10,
          color: AppColors.whiteColor,
          icon: SvgPicture.asset(
            R.svg.pin,
            width: Dimens.size40.w,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
