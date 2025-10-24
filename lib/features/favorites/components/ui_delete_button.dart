import 'package:flutter/material.dart';
import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/app/theme/size_config.dart';

class UIDeleteButton extends StatelessWidget {
  final String fileImage;
  const UIDeleteButton({super.key, required this.fileImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height32,
      width: SizeConfig.width32,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
          width: SizeConfig.width01,
        ),
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius08),
      ),
      child: Center(
        child: Image.asset(
          fileImage,
          width: SizeConfig.width18,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
