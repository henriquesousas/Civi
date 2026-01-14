import 'package:deehelp/core/extensions/date_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/core/ui/widgets/image/ui_my_network_image_widget.dart';
import 'package:deehelp/features/incident/domain/usecase/incident_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentTileTopWidget extends StatelessWidget {
  final IncidentOutput incident;
  const IncidentTileTopWidget({super.key, required this.incident});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.lightGreyColor,
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.r),
            child: UIMyNetworkImageWidget(
              imageUrl: incident.product.images.isNotEmpty
                  ? incident.product.images.first.value
                  : '',
              width: Dimens.size70.w,
              height: Dimens.size70.w,
            ),
          ),
        ),
        Expanded(
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                incident.product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.appTextStyles.sectionTitle.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColorBody,
                ),
              ),
              Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: Dimens.size12.sp,
                    color: AppColors.textSecondary,
                  ),
                  Expanded(
                    child: Text(
                      _getLocation(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextStyles.caption1Style.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: Dimens.size12.sp,
                    color: AppColors.textSecondary,
                  ),
                  Text(
                    DateTime.now().toDateWithFullMonth(),
                    style: context.appTextStyles.caption1Style.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColorBody,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getLocation() {
    if (incident.local?.city.isEmpty == true &&
        incident.local?.state.isEmpty == true) {
      return "Local não informado.";
    }

    return "${incident.local?.city} - ${incident.local?.state}";
  }
}
