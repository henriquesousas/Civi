import 'package:flutter/material.dart';
import 'package:yousafe/features/auth/register/components/register_account_header_title.dart';
import 'package:yousafe/shared/components/inputs/primary_text_field.dart';
import 'package:yousafe/shared/extensions/context_extension.dart';

import '../../../../app/theme/app_colors.dart';

class FormPersonalInfo extends StatelessWidget {
  const FormPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterAccountHeaderTitle(
            title: context.strings.formPersonalDataSubtitle,
            subtitle: context.strings.tellAboutYou,
          ),
          SizedBox(height: 32),
          PrimaryTextField(
            labelText: context.strings.registerAccountLabelTextName,
            hintText: context.strings.registerAccountLabelHintName,
            prefixIcon: Icon(
              Icons.person_outline,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ),
          SizedBox(height: 10),
          PrimaryTextField(
            labelText: context.strings.registerAccountLabelTextSurname,
            hintText: context.strings.registerAccountLabelHintSurname,
            prefixIcon: Icon(
              Icons.person_outline,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
