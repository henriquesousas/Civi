import 'package:deehelp/old_core/ui/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../old_core/ui/theme/app_colors.dart';
import '../../../old_core/ui/widgets/button/ui_elevated_button.dart';

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
          padding: EdgeInsets.all(30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              Expanded(
                child: UIElevatedButton(
                  text: "Novo bem",
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                  ),
                  bgColor: AppColors.whiteColor,
                  textColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  press: onNewBemPress,
                ),
              ),
              Expanded(
                child: UIElevatedButton(
                  // width: context.percentWidth(0.3),
                  text: "Sinalizar",
                  icon: const Icon(Icons.campaign),
                  bgColor: AppColors.primaryColor,
                  press: onSinalizePress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
