import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/module/incident/domain/entity/incident.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../old_core/ui/theme/app_colors.dart';
import '../../../../../old_core/ui/theme/dimens.dart';

class IncidentHeader extends StatelessWidget {
  final Incident incident;
  const IncidentHeader({super.key, required this.incident});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: AppColors.whiteColor,
      //   borderRadius: BorderRadius.circular(4),
      //   border: const Border(
      //     bottom: BorderSide(
      //       color: AppColors.lightGreyColor30,
      //       width: 1.0,
      //     ),
      //   ),
      // ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.lightGreyColor30,
          )
          // border: const Border(
          //   bottom: BorderSide(
          //     color: AppColors.lightGreyColor30,
          //     width: 1.0,
          //   ),
          // ),
          ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // const StatusBadgeWidget(status: ProductSatus.active),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGreyColor30),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Vitima#123",
                    style: context.appTextStyles.caption2Style,
                  ),
                )
              ],
            ),
            SizedBox(height: Dimens.size20.h),
            Text(
              incident.product.name,
              style: context.appTextStyles.bodyTextStyle2.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: Dimens.size20.sp,
              ),
            ),
            Text(
              incident.local != null
                  ? "${incident.local?.address} ${incident.local?.city} próximo ${incident.local?.address} "
                  : "Não informado",
              style: context.appTextStyles.bodyTextStyle2.copyWith(
                color: AppColors.textColorBody,
                // fontSize: Dimens.size14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
