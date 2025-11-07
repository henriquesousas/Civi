import 'package:deehelp/features/auth/presentation/register/components/register_account_header_title.dart';
import 'package:deehelp/shared/components/inputs/primary_text_field.dart';
import 'package:deehelp/shared/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors_v2.dart';

class FormPersonalInfo extends StatelessWidget {
  const FormPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterAccountHeaderTitle(
            title: context.strings.formPersonalDataSubtitle,
            subtitle: context.strings.tellAboutYou,
          ),
          const SizedBox(height: 32),
          PrimaryTextField(
            labelText: context.strings.registerAccountLabelTextName,
            hintText: context.strings.registerAccountLabelHintName,
            prefixIcon: const Icon(
              Icons.person_outline,
              color: AppColorsV2.textSecondary,
              size: 20,
            ),
          ),
          const SizedBox(height: 10),
          PrimaryTextField(
            labelText: context.strings.registerAccountLabelTextSurname,
            hintText: context.strings.registerAccountLabelHintSurname,
            prefixIcon: const Icon(
              Icons.person_outline,
              color: AppColorsV2.textSecondary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
