import 'package:deehelp/core/ui/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class OtpHeaderText extends StatelessWidget {
  final String phoneNumber;
  const OtpHeaderText({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Insira o código de verificação",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    'Enviamos um código com 6-digitos para o telefone com final',
              ),
              TextSpan(
                text: _maskedPhoneNumber,

                // style: const TextStyle(
                //   fontWeight: FontWeight.w600,
                //   color: AppColors.primary,
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String get _maskedPhoneNumber {
    if (phoneNumber.length >= 4) {
      final visible = phoneNumber.substring(
        phoneNumber.length - 4,
      );
      return '****$visible';
    }
    return phoneNumber;
  }
}
