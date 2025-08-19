import 'package:flutter/material.dart';
import 'package:yousafe/shared/extensions/text_style_extension.dart';

class UIVerificationFlag extends StatelessWidget {
  final bool isVerified;

  const UIVerificationFlag({
    super.key,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 3,
      ),
      // decoration: BoxDecoration(
      //   color: Colors.black.withValues(alpha: 0.3),
      //   borderRadius: BorderRadius.circular(12),
      // ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isVerified ? Icons.verified : Icons.help_outline,
            size: 12,
            color: isVerified ? Colors.greenAccent : Colors.white,
          ),
          const SizedBox(width: 3),
          Text(
            isVerified ? 'Verificado' : 'Não verificado',
            style: context.getTextStyle.small.copyWith(
              // fontSize: 8,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
