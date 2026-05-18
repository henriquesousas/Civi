import 'package:deehelp/old_core/extension/exports_extension.dart';
import 'package:flutter/material.dart';

class ThinDivider extends StatelessWidget {
  final double indent;
  const ThinDivider({super.key, this.indent = 0});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: context.outline,
      indent: indent,
    );
  }
}
