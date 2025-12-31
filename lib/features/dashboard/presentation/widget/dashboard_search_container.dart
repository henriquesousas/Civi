import 'package:deehelp/core/res/resources.dart';
import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/ui/theme/dimens.dart';

class DashboardSearchContainer extends StatelessWidget {
  const DashboardSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: EdgeInsets.all(Dimens.size22.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(Dimens.defaultButtonRadius.w),
        border: Border.all(
          color: AppColors.lightGreyColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Faça uma pesquisa...',
            style: context.appTextStyles.bodyTextStyle1,
          ),
          UIICon(
            padding: Dimens.size10.w,
            bgColor: AppColors.darkGreyColor10,
            icon: SvgPicture.asset(
              R.svg.search,
              width: Dimens.size16.w,
            ),
          )
        ],
      ),
    );
  }
}
