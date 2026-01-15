import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/features/incident/presentation/views/listing/widgets/incident_tile_content_bottom_widget.dart';
import 'package:deehelp/features/incident/presentation/views/listing/widgets/incident_tile_how_to_widget.dart';
import 'package:deehelp/features/incident/presentation/views/listing/widgets/incident_tile_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentListItemTileWidget extends StatelessWidget {
  final IncidentOutput incident;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double width;
  final VoidCallback? onPressed;
  final bool isPress;
  final bool isLoading;

  const IncidentListItemTileWidget({
    super.key,
    required this.incident,
    this.width = double.infinity,
    this.onPressed,
    this.isPress = false,
    this.padding,
    this.margin,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      radius: 15,
      borderWidth: 1,
      margin: margin ?? EdgeInsets.symmetric(vertical: 5.h),
      boxBorder: BoxBorder.all(color: AppColors.lightGreyColor20),
      borderColor: AppColors.lightGreyColor,
      padding: EdgeInsets.zero,
      showShadow: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed != null
              ? () {
                  HapticFeedback.lightImpact();
                  onPressed!();
                }
              : null,
          borderRadius: BorderRadius.circular(12.r),
          splashColor: AppColors.primaryColor.withValues(alpha: 0.1),
          highlightColor: AppColors.primaryColor.withValues(alpha: 0.05),
          child: Container(
            padding: padding ?? EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IncidentTileTopWidget(incident: incident),
                if (!isLoading) ...[
                  SizedBox(height: Dimens.size10.h),
                  IncidentTileHowToWidget(howTo: incident.howTo),
                  SizedBox(height: Dimens.size10.h),
                  IncidentTileContentBottomWidget(incident: incident),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
