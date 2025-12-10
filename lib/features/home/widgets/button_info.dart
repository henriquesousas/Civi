import 'package:deehelp/core/ui/assets/resources.dart';
import 'package:flutter/material.dart';

import '../../../core/components/ui_my_assets_image_widget.dart';
import '../../../core/theme/app_colors.dart';

class ButtonInfo extends StatelessWidget {
  const ButtonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom + 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor, width: 1),
          borderRadius: BorderRadius.circular(90),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 15,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: UIMyAssetsImageWidget(
          isSvg: true,
          assetPath: R.images.svgMapInfo,
          width: 35,
          height: 35,
        ),
      ),
    );
  }
}
