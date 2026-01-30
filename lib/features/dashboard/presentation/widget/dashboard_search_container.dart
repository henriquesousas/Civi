import 'package:deehelp/core/resources.dart';
import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/widgets/icon/ui_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ui/theme/dimens.dart';

class DashboardSearchContainer extends StatelessWidget {
  const DashboardSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.search),
      child: Container(
        width: context.screenWidth,
        padding: EdgeInsets.all(Dimens.size10.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(Dimens.defaultButtonRadius.w),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 5),
            Text(
              'Faça uma pesquisa...',
              style: context.appTextStyles.bodyTextStyle1.copyWith(
                color: AppColors.textTertiary,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Spacer(),
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
      ),
    );
  }
}
