import 'package:flutter/material.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class LoginOr extends StatelessWidget {
  const LoginOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.greyColor)),
        Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Text(
            'Ou',
            style: context.getTextStyle.regular.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.greyColor)),
      ],
    );
  }
}
