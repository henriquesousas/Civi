import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_features/onboarding/page/onboard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnboardContent extends StatefulWidget {
  final OnboardItem page;
  const OnboardContent({super.key, required this.page});

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(32),
        child: Column(
          children: [
            Lottie.asset(
              widget.page.lottieAsset ?? "",
              animate: false,
              width: 250.w,
            ),
            const SizedBox(height: Dimens.size10),
            Text(
              widget.page.title,
              style: context.appTextStyles.bodyTextStyle2.copyWith(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimens.size10.h),
            Text(
              widget.page.description,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: context.appTextStyles.bodyTextStyle1,
            ),
          ],
        ),
      ),
    );
  }
}
