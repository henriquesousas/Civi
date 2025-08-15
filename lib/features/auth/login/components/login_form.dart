import 'package:flutter/material.dart';
import 'package:yousafe/app/theme/app_colors.dart';
import 'package:yousafe/features/auth/login/components/login_google_button.dart';
import 'package:yousafe/features/auth/login/components/login_or.dart';
import 'package:yousafe/shared/components/buttons/primary_button.dart';
import 'package:yousafe/shared/components/inputs/primary_text_field.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        PrimaryTextField(
          labelText: context.strings.labelTextEmail,
          hintText: context.strings.hintEmail,
          textInputType: TextInputType.emailAddress,
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: AppColors.textSecondary,
            size: 20,
          ),
        ),
        PrimaryTextField(
          hintText: context.strings.hintPassword,
          labelText: context.strings.labelTextPassword,
          obscureText: true,
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: AppColors.textSecondary,
            size: 20,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.visibility_off,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              context.strings.forgotPassword,
              style: context.getTextStyle.regular.copyWith(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        PrimaryButton(
          text: context.strings.buttonEnter,
          onPressed: () {},
        ),
        LoginOr(),
        LoginGoogleButton(),
      ],
    );
  }
}
