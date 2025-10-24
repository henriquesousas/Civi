import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:deehelp/app/router/router_config.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:deehelp/shared/extensions/text_style_extension.dart';

import '../../../../../app/theme/app_colors.dart';

class LoginNoHaveAccount extends StatelessWidget {
  const LoginNoHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Ainda não tem uma conta? ",
          style: context.getTextStyle.smallMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        TextButton(
          onPressed: () {
            context.push(Routes.registerAccount);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            context.strings.buttonClickHere,
            style: context.getTextStyle.regular.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
