import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../old_core/ui/theme/app_colors.dart';
import '../../../../../old_core/ui/widgets/card/ui_custom_app_card.dart';

class CardTypeIncident extends StatelessWidget {
  final VoidCallback press;
  final bool selected;
  final String title;
  final String subTitle;
  final Widget child;
  const CardTypeIncident(
      {super.key,
      required this.press,
      required this.selected,
      required this.title,
      required this.subTitle,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      onPressed: press,
      borderColor: selected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.outlineVariant,
      borderWidth: selected ? 2 : 1,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 5,
            children: [
              Container(
                width: Dimens.size20.w,
                height: Dimens.size20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? AppColors.primaryColor : Colors.white,
                  border: Border.all(
                    color:
                        selected ? AppColors.primaryColor : AppColors.greyColor,
                  ),
                ),
                child: Icon(
                  Icons.check,
                  size: 12.w,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                title,
                style: context.appTextStyles.sectionTitle.copyWith(
                  // fontWeight: FontWeight.w600,
                  // color: AppColors.darkGreyColor,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          Text(
            subTitle,
            style: context.appTextStyles.sectionSubTitle1.copyWith(
              color: Theme.of(context).colorScheme.surfaceDim,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
