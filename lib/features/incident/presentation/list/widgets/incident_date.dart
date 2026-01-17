import 'package:deehelp/core/extensions/date_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentDate extends StatelessWidget {
  final DateTime occurreAt;
  const IncidentDate({super.key, required this.occurreAt});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: Dimens.size12.sp,
          color: AppColors.textSecondary,
        ),
        Text(
          occurreAt.toDateWithFullMonth(),
          style: context.appTextStyles.caption1Style.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.textColorBody,
          ),
        ),
      ],
    );
  }
}
