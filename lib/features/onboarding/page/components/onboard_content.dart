import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:deehelp/features/onboarding/page/onboard_item.dart';
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
        padding: const EdgeInsetsGeometry.all(24),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Lottie.asset(
                widget.page.lottieAsset ?? "",
                animate: false,
                width: 220.w,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                spacing: 10,
                children: [
                  Text(
                    widget.page.title,
                    style: context.appTextStyles.bodyTextStyle2.copyWith(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
          ],
        ),
      ),
    );
  }
}
