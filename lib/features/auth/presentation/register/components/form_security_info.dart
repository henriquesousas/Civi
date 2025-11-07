import 'package:deehelp/features/auth/presentation/register/components/register_account_header_title.dart';
import 'package:deehelp/shared/components/inputs/primary_text_field.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors_v2.dart';
import 'check_terms.dart';

class FormSecurityInfo extends StatelessWidget {
  const FormSecurityInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterAccountHeaderTitle(
            title: context.strings.formSecurityTitle,
            subtitle: context.strings.formSecuritySubtitle,
          ),
          SizedBox(height: 32),
          PrimaryTextField(
            labelText: context.strings.labelTextPassword,
            hintText: context.strings.registerAccountLabelHintCreatePassword,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.visibility_off,
                color: AppColorsV2.textSecondary,
                size: 20,
              ),
            ),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: AppColorsV2.textSecondary,
              size: 20,
            ),
          ),
          SizedBox(height: 10),
          PrimaryTextField(
            labelText: context.strings.registerAccountLabelTextConfirmPassword,
            hintText: context.strings.registerAccountLabelHintConfirmPassword,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: AppColorsV2.textSecondary,
              size: 20,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.visibility_off,
                color: AppColorsV2.textSecondary,
                size: 20,
              ),
            ),
          ),
          SizedBox(height: 10),
          CheckTerms(
            value: true,
            title: context.strings.labelAgreeTerms,
            isRequired: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
