import 'package:deehelp/core/ui/assets/resources.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/features/map/presentation/widget/toogle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/ui/theme/app_colors.dart';
import '../../../../core/ui/theme/dimens.dart';

class IncidentModalOwnSection extends StatelessWidget {
  const IncidentModalOwnSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.size10, vertical: Dimens.size20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                const Icon(
                  Icons.visibility_outlined,
                  color: AppColors.textColorBody,
                ),
                Text(
                  "Visivel",
                  style: context.appTextStyles.bodyTextStyle2.copyWith(
                    color: AppColors.textColorBody,
                    fontSize: Dimens.size14.sp,
                  ),
                ),
                const Spacer(),
                const ToogleButtons(),
              ],
            ),

            //LInha 2
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                const Icon(
                  Icons.delete_outlined,
                  color: AppColors.errorColor,
                ),
                Text(
                  "Remover",
                  style: context.appTextStyles.bodyTextStyle2.copyWith(
                    color: AppColors.errorColorDark,
                    fontSize: Dimens.size14.sp,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  R.images.svgArrowFront,
                  height: Dimens.size16.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textColorBody,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
