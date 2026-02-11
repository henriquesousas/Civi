import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_core/ui/widgets/card/ui_custom_app_card.dart';
import 'package:deehelp/old_features/incident/domain/enum/incident_status.dart';
import 'package:deehelp/old_features/incident/domain/usecase/incident_output.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_code.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_date.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_image.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_location.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_protocol.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_how_to.dart';
import 'package:deehelp/old_features/incident/presentation/list/widgets/incident_title.dart';
import 'package:deehelp/old_features/products/presentation/views/listing/widgets/status_badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentListItem extends StatelessWidget {
  final IncidentOutput incident;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double width;
  final VoidCallback? onPressed;
  final bool isPress;
  final bool isLoading;

  const IncidentListItem({
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
      // boxBorder: BoxBorder.all(color: AppColors.lightGreyColor20),
      // borderColor: AppColors.lightGreyColor,
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
                Row(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IncidentImage(images: incident.product.images),
                    Expanded(
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IncidentTitle(title: incident.product.name),
                          IncidentLocation(local: incident.local),
                          IncidentDate(occurreAt: incident.occurredAt)
                        ],
                      ),
                    ),
                  ],
                ),
                if (!isLoading) ...[
                  SizedBox(height: Dimens.size10.h),
                  IncidentHowTo(howTo: incident.howTo),
                  SizedBox(height: Dimens.size10.h),
                  Row(
                    spacing: 5,
                    children: [
                      IncidentProtocol(protocolNumber: incident.alertId),
                      IncidentCode(code: incident.product.code),
                      StatusBadgeWidget(
                        label: incident.status.label,
                        color: incident.status.color,
                        iconData: incident.status.icon,
                      ),
                    ],
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
