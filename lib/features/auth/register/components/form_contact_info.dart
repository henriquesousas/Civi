import 'package:flutter/material.dart';
import 'package:yousafe/features/auth/register/components/register_account_header_title.dart';
import 'package:yousafe/shared/components/inputs/primary_text_field.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';

import '../../../../app/theme/app_colors.dart';

class FormContactInfo extends StatelessWidget {
  const FormContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterAccountHeaderTitle(
            title: context.strings.formContactTitle,
            subtitle: context.strings.formContactSubtitle,
          ),
          SizedBox(height: 32),
          PrimaryTextField(
            labelText: context.strings.labelTextEmail,
            hintText: context.strings.hintEmail,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ),
          SizedBox(height: 10),
          PrimaryTextField(
            labelText: context.strings.registerAccountLabelTextPhone,
            hintText: context.strings.registerAccountLabelHintPhone,
            prefixIcon: Icon(
              Icons.phone_outlined,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
