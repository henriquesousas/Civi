import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportIncidentInfo extends StatelessWidget {
  const ReportIncidentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.size10.w,
        vertical: Dimens.size10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.lightGreyColor30,
      ),
      child: Text(
        "Detalhes que você pode incluir:",
        style: context.appTextStyles.caption1Style.copyWith(
          color: AppColors.darkGreyColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
