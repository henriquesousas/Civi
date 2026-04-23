import 'package:deehelp/v2/core/extensions/export_extension.dart';
import 'package:deehelp/v2/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

class UICard extends StatelessWidget {
  final Widget child;
  final double radius;
  const UICard({
    super.key,
    required this.child,
    this.radius = SizeRadius.s,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: context.themeColor.primaryBgColor,
        // color: Color(0Xff171717),
        color: Color(0xFF111111),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: context.themeColor.outlineVariant,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
