import 'package:deehelp/core/ui/styles/export_style.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentHowTo extends StatelessWidget {
  final String? howTo;
  const IncidentHowTo({super.key, required this.howTo});

  @override
  Widget build(BuildContext context) {
    return howTo != null
        ? Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              // color: AppColors.lightGreyColor.withValues(alpha: 0.3),
              color:
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.report_outlined,
                  size: 16.sp,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    howTo ?? "Não informado como aconteceu...",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.appText.caption.copyWith(
                      color: AppColors.textColorBody,
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
