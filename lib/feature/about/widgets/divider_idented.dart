import 'package:deehelp/old_core/extension/color_extension.dart';
import 'package:flutter/material.dart';

class DividerIndented extends StatelessWidget {
  const DividerIndented({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: 52,
      color: context.outline,
    );
  }
}
