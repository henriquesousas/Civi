import 'package:deehelp/app/router/router_config.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../core/resources/resources.dart';

class LoginNoHaveAccount extends StatelessWidget {
  const LoginNoHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(Routes.registerAccount);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.percentWidth(0.1),
          vertical: 30,
        ),
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: "${R.strings.parts(text: R.strings.notHaveAccount).first} \n",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
            children: <TextSpan>[
              TextSpan(
                text: R.strings.parts(text: R.strings.notHaveAccount).last,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
