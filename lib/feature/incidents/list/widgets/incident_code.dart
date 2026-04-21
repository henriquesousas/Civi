import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentCode extends StatelessWidget {
  final String code;
  const IncidentCode({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.grey.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        // code.length > 5 ? code.substring(0, 5) : code,
        code,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.appTextOld.caption.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
