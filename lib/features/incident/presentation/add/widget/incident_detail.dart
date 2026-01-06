import 'package:deehelp/core/extensions/date_extension.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/res/resources.dart';
import '../../../../../core/ui/theme/app_colors.dart';
import '../../../../../core/ui/theme/dimens.dart';

class IncidentDetail extends StatelessWidget {
  final String plateNumber;
  final DateTime occurredOn;
  final DateTime createdAt;
  // final IncidentType incidentType;
  const IncidentDetail({
    super.key,
    required this.plateNumber,
    required this.occurredOn,
    required this.createdAt,
    // required this.incidentType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.lightGreyColor30,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.size10.w,
          vertical: Dimens.size20.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Text("Mais detalhes", style: context.appTextStyles.sectionTitle),
            //Placa
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                SvgPicture.asset(
                  R.svg.listInactive,
                  height: Dimens.size16.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textColorBody,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  "Placa",
                  style: context.appTextStyles.bodyTextStyle2.copyWith(
                    color: AppColors.textColorBody,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    plateNumber,
                    style: context.appTextStyles.sectionBodyTextStyle.copyWith(
                      color: AppColors.primaryColorDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // const PlateNumberWidget(plateNumber: 'DND0171'),
              ],
            ),
            //Hora aproximada
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                SvgPicture.asset(
                  R.svg.time,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textColorBody,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  "Hora aproximada",
                  style: context.appTextStyles.bodyTextStyle2.copyWith(
                    color: AppColors.textColorBody,
                  ),
                ),
                const Spacer(),
                Text(
                  "00:00",
                  style: context.appTextStyles.sectionBodyTextStyle.copyWith(
                    color: AppColors.textColorBody,
                  ),
                ),
              ],
            ),
            //Data
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                SvgPicture.asset(
                  "assets/svg/calendar.svg",
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textColorBody,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  "Data",
                  style: context.appTextStyles.bodyTextStyle2.copyWith(
                    color: AppColors.textColorBody,
                  ),
                ),
                const Spacer(),
                Text(
                  occurredOn.toDateWithFullMonth(),
                  style: context.appTextStyles.sectionBodyTextStyle.copyWith(
                    color: AppColors.textColorBody,
                  ),
                ),
              ],
            ),
            //Tipo
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                SvgPicture.asset(
                  R.svg.category,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textColorBody,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  "Tipo",
                  style: context.appTextStyles.bodyTextStyle2.copyWith(
                    color: AppColors.textColorBody,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Any",
                    style: context.appTextStyles.sectionBodyTextStyle.copyWith(
                      color: AppColors.primaryColorDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
