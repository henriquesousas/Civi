import 'package:deehelp/app/theme/app_colors.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/resources.dart';

class LoginOr extends StatelessWidget {
  const LoginOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.greyColor)),
        Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Text(
            R.strings.or,
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
