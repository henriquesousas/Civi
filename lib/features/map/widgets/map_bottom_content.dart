import 'package:deehelp/core/extensions/screen_size_extension.dart';
import 'package:deehelp/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/buttons/ui_elevated_button.dart';

class MapBottomContent extends StatelessWidget {
  final VoidCallback onNewBemPress;
  final VoidCallback onSinalizePress;
  const MapBottomContent(
      {super.key, required this.onNewBemPress, required this.onSinalizePress});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: context.screenHeight,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            color: AppColors.textTertiary.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        // height: 90,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            spacing: 5,
            children: [
              Text(
                "Total: 32",
                style: context.appTextStyles.sectionSubTitle1.copyWith(
                  color: AppColors.successColor2,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              UIElevatedButton(
                width: context.percentWidth(0.3),
                text: "Novo bem",
                radius: 6,
                icon: const Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                ),
                bgColor: AppColors.whiteColor,
                textColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
                press: onNewBemPress,
              ),
              UIElevatedButton(
                width: context.percentWidth(0.3),
                text: "Sinalizar",
                radius: 6,
                icon: const Icon(Icons.campaign),
                bgColor: AppColors.primaryColor,
                press: onSinalizePress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
