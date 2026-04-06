import 'package:deehelp/core/extension/exports_extension.dart';
import 'package:flutter/material.dart';

class SoftDivider extends StatelessWidget {
  const SoftDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: 70,
      color: context.outlineVariantColor,
    );
  }
}
