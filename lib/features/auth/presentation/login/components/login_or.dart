import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class LoginOr extends StatelessWidget {
  const LoginOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.lightGreyColor20)),
        Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Text(
            "OU",
            // style: context.getTextStyle.regular.copyWith(
            //   color: AppColorsV2.textTertiary,
            // ),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.lightGreyColor20)),
      ],
    );
  }
}
