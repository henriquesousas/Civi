import 'package:deehelp/core/ui/extensions/context_extension.dart';
import 'package:deehelp/features/auth/presentation/register/components/register_account_header_title.dart';
import 'package:flutter/material.dart';

class FormContactInfo extends StatelessWidget {
  const FormContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterAccountHeaderTitle(
            title: "nformações de contato",
            subtitle: "Como podemos falar com você?",
          ),
          const SizedBox(height: 32),
          // PrimaryTextField(
          //   labelText: context.strings.labelTextEmail,
          //   hintText: context.strings.hintEmail,
          //   prefixIcon: const Icon(
          //     Icons.email_outlined,
          //     color: AppColorsV2.textSecondary,
          //     size: 20,
          //   ),
          // ),
          const SizedBox(height: 10),
          // PrimaryTextField(
          //   labelText: context.strings.registerAccountLabelTextPhone,
          //   hintText: context.strings.registerAccountLabelHintPhone,
          //   prefixIcon: const Icon(
          //     Icons.phone_outlined,
          //     color: AppColorsV2.textSecondary,
          //     size: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}
