import 'package:deehelp/core/ui/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class OtpChangeNumber extends StatelessWidget {
  const OtpChangeNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.edit_outlined,
            // color: AppColorsV2.textSecondary,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            "Mudar número de telefone",
          ),
        ],
      ),
    );
  }
}
