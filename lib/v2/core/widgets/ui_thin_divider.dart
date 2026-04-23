import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:flutter/material.dart';

class UIThinDivider extends StatelessWidget {
  final double indent;
  const UIThinDivider({super.key, this.indent = 0});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: context.themeColor.outline,
      indent: indent,
    );
  }
}
