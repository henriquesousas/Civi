import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class FaqHeaderCard extends StatelessWidget {
  final Widget child;
  const FaqHeaderCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: context.surface,
      //   borderRadius: BorderRadius.circular(RadiusSize.lg),
      // boxShadow: const [
      //   BoxShadow(
      //     color: Color(0x1F2157F8),
      //     blurRadius: 18,
      //     offset: Offset(0, 10),
      //   ),
      // ],
      // ),
      // decoration: BoxDecoration(
      //   color: const Color(0xFF101012),
      //   borderRadius: BorderRadius.circular(24),
      //   border: Border.all(color: const Color(0xFF1D1D21)),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Color(0x1F2157F8),
      //       blurRadius: 18,
      //       offset: Offset(0, 10),
      //     ),
      //   ],
      // ),
      decoration: BoxDecoration(
        color: context.secondaryContainer,
        borderRadius: BorderRadius.circular(RadiusSize.lg),
        border: Border.all(color: context.outlineVariantColor),
        boxShadow: const [
          BoxShadow(
            color: Color(0x142B5BEE),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(RadiusSize.lg),
        child: DefaultTextStyle.merge(
          style: const TextStyle(color: Colors.white),
          child: child,
        ),
      ),
    );
  }
}
