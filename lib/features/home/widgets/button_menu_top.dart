import 'package:flutter/material.dart';

import '../../../core/components/icon/ui_icon.dart';
import '../../../core/theme/app_colors.dart';

class ButtonMenuTop extends StatelessWidget {
  const ButtonMenuTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 10,
      child: const UIICon(
        radius: 90,
        bgColor: AppColors.whiteColor,
        icon: Icon(
          Icons.menu,
          size: 32,
        ),
      ),
    );
  }
}
