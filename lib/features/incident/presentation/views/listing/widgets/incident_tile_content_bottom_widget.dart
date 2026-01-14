import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/products/presentation/views/listing/widgets/status_badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentTileContentBottomWidget extends StatelessWidget {
  final IncidentOutput incident;
  const IncidentTileContentBottomWidget({super.key, required this.incident});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.fingerprint_outlined,
                size: 14.sp,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: 4.w),
              Text(
                "Protocolo: ${incident.alertId}",
                style: context.appTextStyles.caption1Style.copyWith(
                  fontSize: 11.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 2.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.primaryColor.withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            incident.product.code,
            style: context.appTextStyles.caption1Style.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        StatusBadgeWidget(
          label: incident.status.label,
          color: incident.status.color,
          iconData: incident.status.icon,
        ),
      ],
    );
  }
}
