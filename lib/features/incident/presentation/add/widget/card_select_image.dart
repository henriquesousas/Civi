import 'package:deehelp/core/router/router_constants.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/ui/widgets/card/ui_custom_app_card.dart';

class CardSelectImage extends StatelessWidget {
  final VoidCallback press;
  final bool isSelected;
  const CardSelectImage({
    super.key,
    required this.press,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return UICustomAppCard(
      // borderColor:
      //     isSelected ? AppColors.primaryColor : AppColors.lightGreyColor30,
      // borderWidth: isSelected ? 2 : 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Container(
            width: Dimens.size64.w,
            height: Dimens.size64.h,
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor20,
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: const Icon(
              Icons.image,
              color: AppColors.greyColor,
            ),
          ),
          Text(
            "Selecionar veículo",
            style: context.appTextStyles.bodyTextStyle1,
          ),
          const Spacer(),
          IconButton(
            onPressed: press,
            // onPressed: () {
            //   context.push(RouterConstant.myItems);
            // },
            icon: const Icon(
              Icons.arrow_circle_right,
              color: AppColors.darkGreyColor10,
              // size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
